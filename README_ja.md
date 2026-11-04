<p align="center">
  <img src="assets/thorium-purple-lightning.png" width="220" alt="Thorium Browser Emblem">
</p>

# Thorium Browser 159（純血 AVX2 旗艦版）- RIME IME統合＆自適応Ozoneプラットフォーム

[![リリース](https://img.shields.io/badge/リリース-v159.0.8137.0-blue.svg)](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/tag/v159.0.8137.0)
[![アーキテクチャ](https://img.shields.io/badge/アーキテクチャ-AVX2%20%2B%20FMA3%20(Haswell%20%2F%20Zen%202%2B)-green.svg)](SUPPORT_MATRIX.md)
[![SIMD](https://img.shields.io/badge/SIMD-256--bit%20YMM%20(純血実測検証済み)-orange.svg)](SUPPORT_MATRIX.md)
[![IME](https://img.shields.io/badge/IME-RIME%20%2F%20Fcitx5%20(ゼロリーク)-yellow.svg)](#2-rime--fcitx5-統合と免疫ゲート)
[![ディスプレイ](https://img.shields.io/badge/Display-Adaptive%20Ozone%20(Wayland%2FX11)-purple.svg)](#3-adaptive-ozone-プラットフォームゲート)
[![OAuth](https://img.shields.io/badge/Google%20OAuth-ネイティブ認証-brightgreen.svg)](#4-公式-google-oauth-20-クレデンシャル統合)
[![ライセンス](https://img.shields.io/badge/License-BSD--3--Clause-lightgrey.svg)](LICENSE)
[![AVX-512 版](https://img.shields.io/badge/AVX--512%20版-こちらへ-brightgreen.svg)](https://github.com/obhasashare2024-namo/thorium-avx512-rime)

[English](README.md) | [繁體中文](README_zh.md) | [日本語](README_ja.md) | [ハードウェア互換性表](SUPPORT_MATRIX.md) | [技術引き継ぎ書](HANDOFF_M159.md) | [インストールガイド](INSTALL.md)

---

## 概要

**Thorium Browser 159（純血 AVX2 專用旗艦版）** は、**256 ビット AVX2、FMA3、および BMI1/BMI2 拡張命令セット** をサポートする主流の x86-64 プロセッサ向けに最適化された高性能 Chromium（`159.0.8137.0`）ビルドです。

以前のビルドで発生していたコンパイラフラグの脱落（`-msse3 -O2` へのサイレントダウングレード）を完全に解消。`-O3 -mtune=skylake -msse3 -mavx -mavx2 -mfma -mf16c -mno-gather -mno-scatter`、Clang 19、および ThinLTO を適用し、逆アセンブル（`objdump -d` 50万命令サンプリング）により **693 箇所の `%ymm` ベクトル命令**、**7 箇所の FMA3 命令**、および **`%zmm` 0 箇所** を物理確認済みです。Haswell / Zen 2+ 環境において最高峰のベクトルスループットを発揮しながら、命令例外（`SIGILL`）リスクを完全に排除しています。

さらに、**RIME / Fcitx5 7層免疫ゲート**（物理テストで文字漏れゼロを検証済み）および **Adaptive Ozone プラットフォーム ゲート**（Wayland / X11 自動判定）を内蔵しています。

---

## 主な機能と特徴

1. **純血 AVX2 / FMA3 ベクトル最適化（過去の疑似パッケージを完全払拭）**:
   * 専用プロファイル `thorium_x86_profile="avx2_fma"` を使用。
   * Clang 19、C++23、ThinLTO による全域最適化。
   * V8 JavaScript JIT、WebAssembly、および Skia レンダリングパイプラインが 256 ビットレジスタ上で超高速動作。

2. **RIME / Fcitx5 統合と免疫ゲート**:
   * `THORIUM_RIME_IMMUNE_GATE` を内蔵し、文字入力中の未変換英字漏れを完全に遮断。
   * 実機隔離テスト（`isolated-app-testing`）において 100% 安定動作を確認済み。

3. **Adaptive Ozone プラットフォームゲート**:
   * 起動時に `$WAYLAND_DISPLAY` と `$DISPLAY` を動的判定。純粋な Wayland 環境では Wayland ネイティブで動作し、X11 環境では自動的にフォールバック。X サーバーが存在しないマシンでのクラッシュを防止。

4. **公式 Google OAuth 2.0 クレデンシャル統合**:
   * 公式 Thorium API キーと Client ID を内蔵し、Google Web SSO、アカウント同期、Chrome Web Store 拡張機能をサポート。

5. **Thorium Purple テーマと警告バナー非表示**:
   * 専用の紫太極テーマアイコン（16px〜512px）を採用し、起動時の `--no-sandbox` 警告バナーを無効化。

---

## リリース パッケージ（v159.0.8137.0）

[GitHub Releases](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/tag/v159.0.8137.0) からダウンロード可能です：

| ファイル名 | タイプ | サイズ | SHA256 チェックサム |
| :--- | :--- | :--- | :--- |
| `thorium-browser-stable_159.0.8137.0-1_amd64.deb` | Debian/Ubuntu 64-bit 公式 | 128 MB | `99294cb75b0976d8e7efbfb63a90c940e22fb4ff096ec9331b1105ee4d3ddf27` |
| `thorium-browser_159.0.8137.0_AVX2_RIME.deb` | Debian/Ubuntu エイリアス | 128 MB | `99294cb75b0976d8e7efbfb63a90c940e22fb4ff096ec9331b1105ee4d3ddf27` |
| `thorium-browser-159.0.8137.0-avx2-linux-x64.tar.xz` | Linux ポータブル パッケージ | 154 MB | `ca372060e88863dce9187dd843fc8388842bb495d62de5beeaa6678bceded31b` |
| `SHA256SUMS.txt` | チェックサム総表 | 340 B | `0ad5ea9834226cfd15fc24cda481fa1e7924ef2ae60b64ca7a898858e65eef8c` |

---

## インストールと起動

### Debian / Ubuntu / Linux Mint
```bash
sudo dpkg -i thorium-browser-stable_159.0.8137.0-1_amd64.deb
sudo apt-get install -f # 依存関係の修復
thorium-browser
```

### Arch Linux / CachyOS / Artix / Manjaro
```bash
tar -xf thorium-browser-159.0.8137.0-avx2-linux-x64.tar.xz
cd thorium-browser-159.0.8137.0-avx2-linux-x64
./chrome
```

---

## ハードウェア互換性

* **対応 CPU (Intel)**: 第4世代 Core（Haswell）〜第14世代 Core、Xeon E5 v3/v4、Xeon Scalable、Intel Core Ultra。
* **対応 CPU (AMD)**: Ryzen 1000〜9000 シリーズ（Zen 1〜Zen 5）、EPYC、Threadripper。
* **AVX-512 CPU**: お使いの CPU が AVX-512 をサポートしている場合は、[Thorium AVX-512 版](https://github.com/obhasashare2024-namo/thorium-avx512-rime) を推奨します。

---

## ライセンス

Thorium の変更点およびビルド スクリプトは BSD-3-Clause ライセンスで公開されています。Chromium は元の Chromium オープンソース ライセンスに準拠します。
