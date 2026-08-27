#!/bin/bash
set -euo pipefail

echo "=== Thorium Browser (AVX2 Edition) Build Pipeline ==="

SRC_DIR="/home/namobuddha/chromium/src"
OUT_DIR="${SRC_DIR}/out/thorium_avx2"
CONFIG_FILE="$(dirname "$0")/../config/args_avx2.gn"

echo "[1/4] Applying AVX2 Toolchain Segregation Patches..."
cd "${SRC_DIR}"
git apply "$(dirname "$0")/../patches/0001-toolchain-segregation-avx2.patch" || true
git apply "$(dirname "$0")/../patches/0002-webui-color-change-listener-android-fix.patch" || true

echo "[2/4] Generating Build Configuration..."
mkdir -p "${OUT_DIR}"
cp "${CONFIG_FILE}" "${OUT_DIR}/args.gn"
gn gen "${OUT_DIR}"

echo "[3/4] Compiling Thorium (AVX2 Target)..."
autoninja -C "${OUT_DIR}" chrome chrome_sandbox

echo "[4/4] Generating Distribution Packages..."
echo "Build complete: ${OUT_DIR}/chrome"
