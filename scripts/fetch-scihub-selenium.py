#!/usr/bin/env python3
"""
Fetch a paper PDF from Sci-Hub using Selenium (headless Chrome).
Properly waits for ALTCHA CAPTCHA auto-solve and page redirect.

Usage:
    python3 scripts/fetch-scihub-selenium.py <doi> <output-file>
    python3 scripts/fetch-scihub-selenium.py 10.1016/j.eswa.2022.118497 articles/paper.pdf
"""

import sys
import os
import time
import urllib.request

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

MIRRORS = [
    "https://sci-hub.ru",
    "https://sci-hub.st",
]

def make_driver():
    opts = Options()
    opts.add_argument("--headless=new")
    opts.add_argument("--disable-gpu")
    opts.add_argument("--no-sandbox")
    opts.add_argument("--disable-dev-shm-usage")
    opts.add_argument("--window-size=1280,1024")
    opts.add_argument("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
    driver = webdriver.Chrome(options=opts)
    driver.set_page_load_timeout(45)
    return driver


def extract_pdf_url(driver, mirror):
    """Extract PDF URL from the loaded Sci-Hub page."""
    # Method 1: citation_pdf_url meta tag
    try:
        meta = driver.find_element(By.CSS_SELECTOR, 'meta[name="citation_pdf_url"]')
        url = meta.get_attribute("content")
        if url:
            if url.startswith("/"):
                url = mirror + url
            return url
    except:
        pass

    # Method 2: embed element
    try:
        embed = driver.find_element(By.CSS_SELECTOR, 'embed[type="application/pdf"], embed[src*=".pdf"]')
        url = embed.get_attribute("src")
        if url:
            if url.startswith("//"):
                url = "https:" + url
            elif url.startswith("/"):
                url = mirror + url
            return url
    except:
        pass

    # Method 3: iframe with PDF
    try:
        iframe = driver.find_element(By.CSS_SELECTOR, 'iframe[src*="pdf"], iframe[src*="storage"]')
        url = iframe.get_attribute("src")
        if url:
            if url.startswith("//"):
                url = "https:" + url
            elif url.startswith("/"):
                url = mirror + url
            return url
    except:
        pass

    # Method 4: any link with .pdf
    try:
        links = driver.find_elements(By.CSS_SELECTOR, 'a[href*=".pdf"]')
        for link in links:
            url = link.get_attribute("href")
            if url and ".pdf" in url:
                return url
    except:
        pass

    return None


def is_not_found(driver):
    """Check if Sci-Hub says the article is not available."""
    try:
        title = driver.title.lower()
        if "not available" in title or "not found" in title:
            return True
        body = driver.find_element(By.TAG_NAME, "body").text[:500].lower()
        if "article not found" in body or "not available" in body:
            return True
    except:
        pass
    return False


def has_captcha(driver):
    """Check if ALTCHA captcha widget is present and not yet verified."""
    try:
        # Check for altcha widget
        altcha = driver.find_elements(By.CSS_SELECTOR, "altcha-widget, .altcha")
        if not altcha:
            return False
        # Check if it's already verified
        body_html = driver.page_source[:5000]
        if "altcha-verified" in body_html:
            return False  # Already solved
        return True
    except:
        return False


def wait_for_captcha_solve(driver, timeout=30):
    """Wait for ALTCHA to auto-solve (it's proof-of-work, not human)."""
    start = time.time()
    while time.time() - start < timeout:
        try:
            # Check if page has navigated past captcha
            if "citation_pdf_url" in driver.page_source:
                return True
            # Check for embed
            if "<embed" in driver.page_source:
                return True
            # Check if altcha verified and form submitted
            html = driver.page_source[:3000]
            if "altcha-verified" in html:
                # Try clicking submit or waiting for auto-submit
                try:
                    submit = driver.find_element(By.CSS_SELECTOR, 'button[type="submit"], input[type="submit"]')
                    submit.click()
                    time.sleep(3)
                    if "citation_pdf_url" in driver.page_source:
                        return True
                except:
                    pass
                time.sleep(2)
                continue
        except:
            pass
        time.sleep(1)
    return False


def try_mirror(driver, mirror, doi):
    """Try fetching from a specific mirror."""
    url = f"{mirror}/{doi}"
    print(f"  Trying: {url}", file=sys.stderr)

    try:
        driver.get(url)
    except Exception as e:
        print(f"    Navigation failed: {e}", file=sys.stderr)
        return None

    time.sleep(2)  # Let page settle

    # Check if article not found
    if is_not_found(driver):
        print("    Article not available", file=sys.stderr)
        return None

    # Check for CAPTCHA
    if has_captcha(driver):
        print("    ALTCHA detected, waiting for auto-solve...", file=sys.stderr)
        if not wait_for_captcha_solve(driver, timeout=40):
            print("    ALTCHA did not auto-solve in time", file=sys.stderr)
            return None
        print("    ALTCHA solved, page loading...", file=sys.stderr)
        time.sleep(3)

    # Extract PDF URL
    pdf_url = extract_pdf_url(driver, mirror)
    if pdf_url:
        print(f"    Found PDF: {pdf_url}", file=sys.stderr)
        return pdf_url

    # Maybe the page reloaded — try again
    time.sleep(3)
    pdf_url = extract_pdf_url(driver, mirror)
    if pdf_url:
        print(f"    Found PDF (retry): {pdf_url}", file=sys.stderr)
        return pdf_url

    print("    Could not find PDF URL", file=sys.stderr)
    return None


def download_pdf(url, output):
    """Download PDF and verify."""
    try:
        req = urllib.request.Request(url, headers={
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
        })
        with urllib.request.urlopen(req, timeout=120) as resp:
            data = resp.read()

        if len(data) < 10000:
            print(f"    File too small ({len(data)} bytes)", file=sys.stderr)
            return False

        if not data[:5].startswith(b"%PDF"):
            print("    Not a PDF file", file=sys.stderr)
            return False

        os.makedirs(os.path.dirname(output) or ".", exist_ok=True)
        with open(output, "wb") as f:
            f.write(data)

        size_kb = len(data) / 1024
        print(f"    OK: {size_kb:.0f}KB saved to {output}", file=sys.stderr)
        return True
    except Exception as e:
        print(f"    Download failed: {e}", file=sys.stderr)
        return False


def main():
    if len(sys.argv) < 3:
        print("Usage: fetch-scihub-selenium.py <doi> <output-file>", file=sys.stderr)
        sys.exit(1)

    doi = sys.argv[1]
    output = sys.argv[2]

    print(f"Fetching: {doi}", file=sys.stderr)

    driver = make_driver()
    try:
        for mirror in MIRRORS:
            pdf_url = try_mirror(driver, mirror, doi)
            if pdf_url and download_pdf(pdf_url, output):
                sys.exit(0)
    finally:
        driver.quit()

    print("FAILED: Could not download from any mirror", file=sys.stderr)
    sys.exit(1)


if __name__ == "__main__":
    main()
