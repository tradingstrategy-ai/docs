/**
 * download-article-image.js
 *
 * Navigates to an article URL with Playwright, finds all content images,
 * and downloads the last one (typically the most impactful chart/result).
 *
 * Usage: node download-article-image.js <url> <title>
 *
 * Example:
 *   node download-article-image.js "https://www.tradingresearchub.com/p/flipping-the-rsi-script-when-overbought" "RSI Momentum in Crypto"
 *
 * Output: ~/Downloads/tweet-rsi-momentum-in-crypto.png
 */

const { chromium } = require("playwright");
const https = require("https");
const http = require("http");
const fs = require("fs");
const path = require("path");
const os = require("os");

function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 60);
}

function downloadFile(url, dest) {
  return new Promise((resolve, reject) => {
    const proto = url.startsWith("https") ? https : http;
    const request = (currentUrl, redirectCount = 0) => {
      if (redirectCount > 5) {
        reject(new Error("Too many redirects"));
        return;
      }
      proto.get(currentUrl, (res) => {
        if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
          request(res.headers.location, redirectCount + 1);
          return;
        }
        if (res.statusCode !== 200) {
          reject(new Error(`HTTP ${res.statusCode} for ${currentUrl}`));
          return;
        }
        const file = fs.createWriteStream(dest);
        res.pipe(file);
        file.on("finish", () => {
          file.close();
          resolve();
        });
        file.on("error", (err) => {
          fs.unlink(dest, () => {});
          reject(err);
        });
      }).on("error", reject);
    };
    request(url);
  });
}

async function main() {
  const url = process.argv[2];
  const title = process.argv[3];

  if (!url || !title) {
    console.error("Usage: node download-article-image.js <url> <title>");
    process.exit(1);
  }

  const slug = slugify(title);
  const outputPath = path.join(os.homedir(), "Downloads", `tweet-${slug}.png`);

  console.log(`Navigating to: ${url}`);

  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({
    viewport: { width: 1280, height: 900 },
    userAgent:
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
  });
  const page = await context.newPage();

  try {
    await page.goto(url, { waitUntil: "domcontentloaded", timeout: 30000 });
    await page.waitForTimeout(3000);

    // Find all content images, filtering out tiny icons/avatars/logos
    const images = await page.evaluate(() => {
      const imgs = Array.from(document.querySelectorAll("img"));
      return imgs
        .map((img) => ({
          src: img.src || img.getAttribute("data-src") || "",
          naturalWidth: img.naturalWidth,
          naturalHeight: img.naturalHeight,
          alt: img.alt || "",
        }))
        .filter((img) => {
          if (!img.src || img.src.startsWith("data:")) return false;
          // Skip tiny images (icons, avatars, logos)
          if (img.naturalWidth < 200 || img.naturalHeight < 150) return false;
          // Skip common non-content patterns
          const lower = img.src.toLowerCase();
          if (lower.includes("avatar") || lower.includes("logo") || lower.includes("favicon"))
            return false;
          if (lower.includes("profile") || lower.includes("icon"))
            return false;
          return true;
        });
    });

    if (images.length === 0) {
      console.error("No content images found on the page.");
      console.error("Falling back to screenshot...");
      await page.screenshot({
        path: outputPath,
        clip: { x: 0, y: 0, width: 1280, height: 900 },
      });
      console.log(`Screenshot saved to: ${outputPath}`);
    } else {
      const lastImage = images[images.length - 1];
      console.log(`Found ${images.length} content image(s). Downloading the last one.`);
      console.log(`  Image: ${lastImage.alt || "(no alt)"} — ${lastImage.naturalWidth}x${lastImage.naturalHeight}`);
      console.log(`  URL: ${lastImage.src}`);

      await downloadFile(lastImage.src, outputPath);
      console.log(`Image saved to: ${outputPath}`);
    }
  } catch (err) {
    console.error(`Error: ${err.message}`);
    process.exit(1);
  } finally {
    await browser.close();
  }
}

main();
