<p align="center">
  <img src="assets/thorium-purple-lightning.png" width="220" alt="Thorium Browser Emblem">
</p>

# Thorium 瀏覽器 159（純血 AVX2 旗艦版）- 深度整合 RIME 輸入法與雙顯自適應自舉

[![發布版本](https://img.shields.io/badge/發布版本-v159.0.8137.0-blue.svg)](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/tag/v159.0.8137.0)
[![微架構](https://img.shields.io/badge/微架構-AVX2%20%2B%20FMA3%20(Haswell%20%2F%20Zen%202%2B)-green.svg)](SUPPORT_MATRIX.md)
[![SIMD向量](https://img.shields.io/badge/SIMD-256--bit%20YMM%20(純血實測驗證)-orange.svg)](SUPPORT_MATRIX.md)
[![輸入法](https://img.shields.io/badge/輸入法-RIME%20%2F%20Fcitx5%20(零穿透)-yellow.svg)](#二rime--fcitx5-中文輸入法深度整合與免疫門禁)
[![顯示平台](https://img.shields.io/badge/顯示平台-自適應%20Ozone%20(Wayland%2FX11)-purple.svg)](#三雙顯動態自適應平台adaptive-ozone-platform-gate)
[![OAuth認證](https://img.shields.io/badge/Google%20OAuth-官方原生憑證-brightgreen.svg)](#四google-官方-oauth-20-api-憑證原生整合)
[![授權條款](https://img.shields.io/badge/License-BSD--3--Clause-lightgrey.svg)](LICENSE)
[![AVX-512 旗艦版](https://img.shields.io/badge/AVX--512%20旗艦版-點此前往-brightgreen.svg)](https://github.com/obhasashare2024-namo/thorium-avx512-rime)

[English](README.md) | [繁體中文](README_zh.md) | [日本語](README_ja.md) | [硬體支援矩陣](SUPPORT_MATRIX.md) | [架構與技術交接手冊](HANDOFF_M159.md) | [安裝指南](INSTALL.md)

---

## 專案概述

**Thorium 瀏覽器 159（純血 AVX2 專用旗艦版）** 是專為支援 **256 位元 AVX2、FMA3 與 BMI1/BMI2 向量指令集** 之主流 x86-64 處理器量身打造的極速 Chromium（`159.0.8137.0`）發布版。

本版本徹底清洗並終結了先前歷史構建中因編譯參數靜默遺漏而退化為 `-msse3 -O2` 的假包問題。採用 `-O3 -mtune=skylake -msse3 -mavx -mavx2 -mfma -mf16c -mno-gather -mno-scatter` 搭配 Clang 19、LLVM lld 與多執行緒 ThinLTO 全局連結優化。物理二進制反編譯（`objdump -d` 抽檢 50 萬行指令）確證包含 **693 處 `%ymm` 向量暫存器**、**7 處 FMA3 融合乘加指令**，且 **`%zmm` AVX-512 暫存器嚴格為 0**，既保證了 Haswell / Zen 2+ 實體相容性與最高向量吞吐，又杜絕了非法指令崩潰（零 `SIGILL` 風險）。

同時，本版本整合了經過實機隔離測試檢驗的 **RIME（中州韻）/ Fcitx5 七重立體防禦門禁**（空格上屏「能上」，0 字母穿透）與 **雙顯動態自適應平台**（Wayland / X11 自舉），並內嵌 Google 官方 OAuth 2.0 憑證。

---

## 核心亮點與技術特性

### 一、純血 AVX2 / FMA3 指令集全量向量化（歷史假包徹底清洗）
* 採用專屬配置 `thorium_x86_profile="avx2_fma"`；
* 編譯旗標：`-O3 -mtune=skylake -msse3 -mavx -mavx2 -mfma -mf16c -mno-gather -mno-scatter`；
* V8 JavaScript JIT、WebAssembly 與 Skia 圖形渲染流水線全量跑在 256 位元暫存器上；
* 物理反編譯確證 0 處 ZMM，杜絕 AVX-512 越界崩潰。

### 二、RIME / Fcitx5 中文輸入法深度整合與免疫門禁
* 內核整合 `THORIUM_RIME_IMMUNE_GATE` 門禁；
* 當處於組字中（`!composition_.text.empty()`）時，嚴格攔截 raw Latin 按鍵傳播至 DOM，徹底根治敲拼音漏字母（如輸入 `shang` 漏出 `s` 跳出設定選單）與候選框脫離焦點問題；
* 通過物理實機隔離測試（`isolated-app-testing`），完美上屏中文。

### 三、雙顯動態自適應平台（Adaptive Ozone Platform Gate）
* `chrome_main_delegate.cc` 注入動態自舉探查邏輯；
* 自動嗅探 `$WAYLAND_DISPLAY` 與 `$DISPLAY`，純 Wayland 環境下原生自舉 Wayland，X11 環境自動回退 GTK4/X11，徹底杜絕無 X 伺服器機器崩潰閃退。

### 四、Google 官方 OAuth 2.0 API 憑證原生整合
* 內置官方 Thorium API Key 與 Client ID；
* 完美支援 Google 帳號網頁 SSO 登錄、帳號同步及 Chrome Web Store 擴充功能安裝。

### 五、Thorium Purple 經典紫標典藏主題
* 專屬紫曜太極圖標與高清視覺主題包（16px ~ 512px）；
* 核心級移除啟動時的黃色 `--no-sandbox` 警告橫幅。

---

## 預編譯二進制資產（v159.0.8137.0）

可由 [GitHub Releases](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/tag/v159.0.8137.0) 取得預編譯安裝包：

| 檔案名稱 | 類型 | 檔案大小 | SHA256 數位校驗碼 |
| :--- | :--- | :--- | :--- |
| `thorium-browser-stable_159.0.8137.0-1_amd64.deb` | Debian/Ubuntu 64 位元官方包 | 128 MB | `99294cb75b0976d8e7efbfb63a90c940e22fb4ff096ec9331b1105ee4d3ddf27` |
| `thorium-browser_159.0.8137.0_AVX2_RIME.deb` | Debian/Ubuntu 相容別名包 | 128 MB | `99294cb75b0976d8e7efbfb63a90c940e22fb4ff096ec9331b1105ee4d3ddf27` |
| `thorium-browser-159.0.8137.0-avx2-linux-x64.tar.xz` | Linux x64 綠色免安裝便攜包 | 154 MB | `ca372060e88863dce9187dd843fc8388842bb495d62de5beeaa6678bceded31b` |
| `SHA256SUMS.txt` | 官方校驗清單 | 340 B | `0ad5ea9834226cfd15fc24cda481fa1e7924ef2ae60b64ca7a898858e65eef8c` |

---

## 快速安裝與使用

### Debian / Ubuntu / Linux Mint
```bash
sudo dpkg -i thorium-browser-stable_159.0.8137.0-1_amd64.deb
sudo apt-get install -f # 缺依賴時自動補齊
thorium-browser
```

### Arch Linux / CachyOS / Artix / Manjaro
```bash
tar -xf thorium-browser-159.0.8137.0-avx2-linux-x64.tar.xz
cd thorium-browser-159.0.8137.0-avx2-linux-x64
./chrome
```

---

## 硬體支援範圍

* **支援處理器 (Intel)**：第 4 代 Core（Haswell）至第 14 代 Core、Xeon E5 v3/v4、Xeon Scalable、Intel Core Ultra。
* **支援處理器 (AMD)**：Ryzen 1000 至 9000 系列（Zen 1 ~ Zen 5）、EPYC、Threadripper。
* **AVX-512 旗艦架構**：若您的 CPU 支援 AVX-512（Intel 11 代+ 或 AMD Zen 4/5），請選用 [Thorium AVX-512 旗艦版](https://github.com/obhasashare2024-namo/thorium-avx512-rime)。

---

## 授權條款

Thorium 修改與構建腳本基於 BSD-3-Clause 條款開源發布。Chromium 原生代碼遵循原始 Chromium 開源授權。
