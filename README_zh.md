# Thorium 瀏覽器（AVX2 專用旗艦版）- 深度整合 RIME 輸入法與硬體解碼

[![版本](https://img.shields.io/badge/版本-v151.0.7922.72-blue.svg)](packages/)
[![架構](https://img.shields.io/badge/架構-x86__64%20(AVX2)-green.svg)](SUPPORT_MATRIX.md)
[![SIMD](https://img.shields.io/badge/SIMD-256--bit%20AVX2%20%2B%20FMA3-orange.svg)](SUPPORT_MATRIX.md)
[![授權](https://img.shields.io/badge/授權-BSD--3--Clause-lightgrey.svg)](LICENSE)

[English](README.md) | [繁體中文](README_zh.md) | [日本語](README_ja.md) | [支援矩陣](SUPPORT_MATRIX.md)

---

## 專案概述

**Thorium 瀏覽器 AVX2 旗艦版** 是專為支援 **256 位元 AVX2、FMA3 與 BMI1/BMI2 向量指令集** 之現代主流 x86-64 處理器量身打造的高效能發布版（支援 Intel 第 4 代 Haswell、第 5 代 Broadwell 至第 14 代 Raptor Lake，以及 AMD Ryzen 1000 至 9000 全系列處理器）。

透過採用 `-march=haswell -mtune=generic -O3` 與 ThinLTO 全局連結優化，全面加速 DOM 排版、V8 JavaScript 引擎向量化、WebAssembly 執行效能，並內建 RIME / Fcitx5 輸入法防丟失機制與 4K/8K 視訊硬體解碼。

---

## 🌟 核心特性與技術亮點

1. **AVX2 ＆ FMA3 向量指令集全局優化**：
   - 全面啟用 256 位元向量暫存器（`YMM0`~`YMM15`）加速圖形光柵化與多媒體管線，相較於標準版 Chromium 獲得高達 **25%~30% 的綜合效能提速**。
2. **RIME（中州韻 / Fcitx5）長效輸入防失效機制**：
   - 完整支援 Linux 下 Fcitx5 / IBus 候選字框原生跟隨。引入視窗遮蔽保持旗標（`--disable-features=CalculateNativeWinOcclusion`），徹底解決長時間使用或頁籤休眠後輸入法自動失效的系統缺陷。
3. **獨顯與核顯雙軌硬體加速**：
   - 完美相容 Intel Iris Xe / VA-API 與 NVIDIA NVDEC/VDPAU，流暢硬解 4K/8K 60fps AV1、HEVC 與 VP9 串流影片。
4. **編譯主機工具鏈隔離架構（Toolchain Segregation）**：
   - 透過獨立的 `clang_x64_target` 工具鏈定義，徹底杜絕異質構建主機上的宿主代碼生成工具崩潰問題。

---

## 🚀 快速安裝與部署

### Debian / Ubuntu / antiX Linux（.deb）：
```bash
sudo apt update && sudo apt install -y libnss3 libatk1.0-0 libcups2 libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2
sudo dpkg -i packages/thorium-browser_151.0.7922.72_AVX2_RIME.deb || sudo apt-get -f install -y
```

### Arch Linux / Artix Linux（.pkg.tar.zst）：
```bash
sudo pacman -U packages/thorium-browser-avx2-rime-bin-151.0.7922.72-1-x86_64.pkg.tar.zst
```

---

## 📁 專案目錄結構

```text
thorium-avx2-release/
├── README.md               # 英文專案說明
├── README_zh.md            # 繁體中文專案說明
├── README_ja.md            # 日本語專案說明
├── SUPPORT_MATRIX.md       # 詳細微架構與硬體支援矩陣
├── INSTALL.md              # 多發行版安裝與輸入法配置指南
├── .gitattributes          # Git LFS 追蹤規則
├── config/args_avx2.gn     # AVX2 核心構建設定
├── packaging/              # 發行版打包規格 (Arch/Debian)
├── patches/                # 編譯工具鏈隔離與修正補丁
├── packages/               # Git LFS 二進制安裝包與 SHA256SUMS
└── scripts/                # 自動化編譯流水線腳本
```
