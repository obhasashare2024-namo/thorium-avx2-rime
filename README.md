# Thorium Browser (AVX2 & RIME IME Optimized Edition) with Hardware Acceleration

[![Release](https://img.shields.io/badge/Release-v151.0.7922.72-blue.svg)](packages/)
[![Arch](https://img.shields.io/badge/Arch-x86__64%20(AVX2)-green.svg)](SUPPORT_MATRIX.md)
[![SIMD](https://img.shields.io/badge/SIMD-256--bit%20AVX2%20%2B%20FMA3-orange.svg)](SUPPORT_MATRIX.md)
[![License](https://img.shields.io/badge/License-BSD--3--Clause-lightgrey.svg)](LICENSE)

[English](README.md) | [繁體中文](README_zh.md) | [日本語](README_ja.md) | [Support Matrix](SUPPORT_MATRIX.md)

---

## Overview

**Thorium Browser AVX2 Edition** is a high-performance Chromium fork optimized specifically for **Intel Haswell/Broadwell through modern Raptor Lake** CPUs and **AMD Zen 1 through Zen 5** processors supporting **256-bit AVX2, FMA3, and BMI2** vector instructions.

Compiled with `-march=haswell -mtune=generic -O3` and ThinLTO, this release delivers blazing-fast DOM layout, WebAssembly acceleration, V8 JIT vectorization, persistent RIME/Fcitx5 Chinese input support, and full VA-API/NVDEC hardware 4K/8K video decode.

---

## 🌟 Key Features

1. **AVX2 & FMA3 Vector Optimization**:
   - Compiles Chromium core with Clang 19, ThinLTO, and 256-bit vectorization, achieving up to 30% performance gains over stock Chromium.
2. **Persistent RIME IME Integration**:
   - Native inline candidate window positioning on Fcitx5 and IBus with window occlusion keepalive (`--disable-features=CalculateNativeWinOcclusion`), preventing IME focus loss during long browsing sessions.
3. **Discrete & Integrated GPU Hardware Decoding**:
   - Hardware-accelerated 4K/8K 60fps AV1, HEVC, and VP9 video decoding via Intel Iris Xe / VA-API and NVIDIA NVDEC.
4. **Host-Target Toolchain Segregation**:
   - Separates host vs target toolchains (`clang_x64_target`), ensuring clean compilation on heterogeneous build servers without generator tool crashes.

---

## 🚀 Quick Start & Installation

### Debian / Ubuntu / antiX Linux (.deb)
```bash
sudo apt update && sudo apt install -y libnss3 libatk1.0-0 libcups2 libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2
sudo dpkg -i packages/thorium-browser_151.0.7922.72_AVX2_RIME.deb || sudo apt-get -f install -y
```

### Arch Linux (.pkg.tar.zst)
```bash
sudo pacman -U packages/thorium-browser-avx2-rime-bin-151.0.7922.72-1-x86_64.pkg.tar.zst
```

---

## 📁 Repository Structure

```text
thorium-avx2-release/
├── README.md               # English documentation
├── README_zh.md            # Traditional Chinese documentation
├── README_ja.md            # Japanese documentation
├── SUPPORT_MATRIX.md       # Full CPU microarchitecture & GPU matrix
├── INSTALL.md              # Installation & RIME setup guide
├── .gitattributes          # Git LFS tracking rules (packages/*)
├── config/args_avx2.gn     # Chromium GN build configuration
├── packaging/              # Distribution specifications (Arch/Debian)
├── patches/                # Compiler segregation and WebUI patches
├── packages/               # Precompiled packages (via Git LFS) & SHA256SUMS
└── scripts/                # Automated compilation pipeline script
```
