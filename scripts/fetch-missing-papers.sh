#!/bin/bash
#
# Batch-fetch all paywalled paper stubs via Sci-Hub.
# Uses fetch-scihub.sh for each paper.
#
# Usage:
#   ./scripts/fetch-missing-papers.sh [--dry-run] [--parallel N]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ARTICLES_DIR="$(cd "$SCRIPT_DIR/../articles" && pwd)"
FETCH="$SCRIPT_DIR/fetch-scihub.sh"

DRY_RUN=false
PARALLEL=2

while [ $# -gt 0 ]; do
    case "$1" in
        --dry-run) DRY_RUN=true; shift ;;
        --parallel) PARALLEL="$2"; shift 2 ;;
        *) echo "Unknown arg: $1"; exit 1 ;;
    esac
done

# Map: filename|DOI  (one per line, pipe-separated)
PAPERS="
svmd-original-nazari-2020|10.1016/j.sigpro.2020.107610
vmd-tcn-volatility-var|10.1016/j.eswa.2022.118497
vmd-dual-channel-attention-stock|10.1016/j.eswa.2023.121708
vmd-elastic-net-stock-prediction|10.1016/j.dajour.2025.100578
ga-vmd-tcn-stock-index|10.1016/j.eswa.2024.126222
vmd-ica-arima-crude-oil|10.1016/j.physa.2017.05.063
vmd-rsbl-crude-oil-prices|10.1016/j.asoc.2021.108032
vmd-cnn-crude-oil-var|10.1016/j.physa.2019.123360
vmd-gru-pinball-loss-oil-price|10.1016/j.csfx.2024.100105
vmd-iceemdan-lstm-crude-oil-rv|10.1016/j.frl.2023.104153
vmd-exchange-rate-entropy|10.1016/j.physa.2018.09.055
vmd-bitcoin-gam-intraday|10.1016/j.jksuci.2019.09.014
vmd-international-financial-series|10.1016/j.jimonfin.2022.102607
sentiment-vmd-mtl-stock-ranking|10.1016/j.eswa.2026.128086
q-vmd-ann-lstm-gru-volatility|10.1016/j.iref.2025.103982
gwo-vmd-drl-realized-volatility|10.1016/j.eswa.2023.121880
rgarch-vmd-bitcoin-volatility|10.1016/j.pacfin.2025.102731
gavmd-carbon-bilstm-stock-vol|10.1016/j.eneco.2023.107150
multi-scale-garch-gnn-genshin|10.1016/j.frl.2025.107291
disaggregating-vix-decomposition|10.1016/j.ijforecast.2025.01.007
ceemdan-lstm-realized-volatility|10.1016/j.eswa.2022.117736
ceemdan-lstm-carbon-price|10.1016/j.apenergy.2022.118601
ceemdan-informer-lstm-financial|10.1016/j.asoc.2025.113087
ceemdan-deepar-crypto-vol|10.1016/j.physa.2026.130781
ceemdan-rf-lstm-crypto-rv|10.1016/j.future.2024.06.024
ceemdan-vmd-cnn-bilstm-crude-oil|10.1016/j.rineng.2025.105124
ceemdan-transformer-stock-trend|10.1016/j.eswa.2025.130052
ternary-freq-ceemdan-crypto|10.1016/j.eswa.2023.121710
bitcoin-multi-scale-decomposition-dl|10.1016/j.frl.2026.107615
mvmd-nt-tif-stock-prediction|10.1016/j.engappai.2025.110749
mvmd-dft-mogru-multivariate|10.1016/j.eswa.2025.130180
mvmd-attention-lstm-carbon-price|10.1016/j.asoc.2024.111577
memd-tcn-stock-index|10.1016/j.asoc.2023.110356
meemd-lstm-precious-metals|10.1016/j.resourpol.2022.102884
ewt-echo-state-network|10.1016/j.asoc.2021.107063
ewt-deep-multihybrid-crude-oil|10.1016/j.eswa.2020.113511
ewt-deep-ensemble-hf-futures|10.1016/j.dsp.2022.103536
iceemdan-lstm-cnn-cbam-gold|10.1016/j.eswa.2022.117847
ceemdan-lstm-stock-index|10.1016/j.najef.2021.101460
"

# Filter to only papers that need fetching (missing or small stubs)
needs_fetch=""
total=0
need=0

echo "$PAPERS" | grep '|' | while IFS='|' read -r name doi; do
    name=$(echo "$name" | tr -d ' ')
    doi=$(echo "$doi" | tr -d ' ')
    total=$((total + 1))
done

for line in $(echo "$PAPERS" | grep '|'); do
    name=$(echo "$line" | cut -d'|' -f1 | tr -d ' ')
    doi=$(echo "$line" | cut -d'|' -f2 | tr -d ' ')

    f="$ARTICLES_DIR/${name}.pdf"
    if [ -f "$f" ]; then
        size=$(stat -f%z "$f" 2>/dev/null || stat -c%s "$f" 2>/dev/null || echo 0)
        if [ "$size" -gt 200000 ]; then
            continue  # Already fetched
        fi
    fi

    needs_fetch="$needs_fetch
$name|$doi"
    need=$((need + 1))
done

needs_fetch=$(echo "$needs_fetch" | grep '|' || true)

echo "Need fetching: $need papers"
echo ""

if [ -z "$needs_fetch" ]; then
    echo "All papers already downloaded!"
    exit 0
fi

if $DRY_RUN; then
    echo "$needs_fetch" | while IFS='|' read -r name doi; do
        echo "  $name → $doi"
    done
    exit 0
fi

# Fetch papers with parallelism
job_count=0
idx=0

echo "$needs_fetch" | while IFS='|' read -r name doi; do
    name=$(echo "$name" | tr -d ' ')
    doi=$(echo "$doi" | tr -d ' ')
    outfile="$ARTICLES_DIR/${name}.pdf"
    idx=$((idx + 1))

    echo "[$idx] $name ($doi)"

    (
        if "$FETCH" "$doi" "$outfile" >/dev/null 2>&1; then
            echo "  ✓ $name"
        else
            echo "  ✗ $name (failed)"
        fi
    ) &

    job_count=$((job_count + 1))
    if [ "$job_count" -ge "$PARALLEL" ]; then
        wait
        job_count=0
    fi
done

wait

echo ""
echo "Done. Checking results..."

# Report
success=0
failed=0
echo "$needs_fetch" | while IFS='|' read -r name doi; do
    name=$(echo "$name" | tr -d ' ')
    f="$ARTICLES_DIR/${name}.pdf"
    if [ -f "$f" ]; then
        size=$(stat -f%z "$f" 2>/dev/null || stat -c%s "$f" 2>/dev/null || echo 0)
        if [ "$size" -gt 200000 ]; then
            success=$((success + 1))
        else
            failed=$((failed + 1))
            echo "  STILL STUB: $name"
        fi
    else
        failed=$((failed + 1))
        echo "  MISSING: $name"
    fi
done

echo ""
echo "Fetch complete."
