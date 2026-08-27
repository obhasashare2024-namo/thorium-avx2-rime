# Thorium Browser（AVX2＆RIME IME対応版）- ハードウェア動画デコード統合

[![リリース](https://img.shields.io/badge/リリース-v151.0.7922.72-blue.svg)](packages/)
[![アーキテクチャ](https://img.shields.io/badge/アーキテクチャ-x86__64%20(AVX2)-green.svg)](SUPPORT_MATRIX.md)
[![SIMD](https://img.shields.io/badge/SIMD-256--bit%20AVX2%20%2B%20FMA3-orange.svg)](SUPPORT_MATRIX.md)
[![ライセンス](https://img.shields.io/badge/ライセンス-BSD--3--Clause-lightgrey.svg)](LICENSE)

[English](README.md) | [繁體中文](README_zh.md) | [日本語](README_ja.md) | [Support Matrix](SUPPORT_MATRIX.md)

---

## 概要

**Thorium Browser AVX2 対応版** は、**256 ビット AVX2、FMA3、および BMI1/BMI2 拡張命令セット** をサポートする主流の x86-64 プロセッサ（Intel 第4世代 Haswell、第5世代 Broadwell から第14世代 Raptor Lake、および AMD Ryzen 1000〜9000 全シリーズ）向けに最適化された高性能 Chromium フォークです。

`-march=haswell -mtune=generic -O3` および ThinLTO を適用し、DOM レンダリング、V8 JavaScript ベクトル化、WebAssembly の実行性能を大幅に向上させ、長時間のブラウジングでも安定した RIME / Fcitx5 入力と 4K/8K ハードウェア動画デコードを提供します。

---

## 🌟 主な特徴と技術ハイライト

1. **AVX2 ＆ FMA3 ベクトル命令セット最適化**：
   - 256 ビット ベクトルレジスタ（`YMM0`〜`YMM15`）を活用し、標準 Chromium と比較して最大 **25%〜30% の高速化** を実現。
2. **RIME（中州韻 / Fcitx5）IME 長時間安定動作（フォーカス喪失防止）**：
   - Linux 環境での Fcitx5 / IBus 候補ウィンドウのインライン追従に完全対応。ウィンドウ遮蔽追跡保持フラグ（`--disable-features=CalculateNativeWinOcclusion`）により、長時間使用時の入力不能問題を根本解決。
3. **内蔵・独立 GPU ハードウェア動画デコード**：
   - Intel Iris Xe / VA-API および NVIDIA NVDEC に対応し、4K/8K 60fps AV1、HEVC、VP9 動画を滑らかに再生。
4. **ビルドホスト分離ツールチェーン（Toolchain Segregation）**：
   - 独自の `clang_x64_target` ツールチェーン定義により、異種ビルド環境でも安定したビルドを実現。

---

## 🚀 デプロイとインストール手順

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

## 📁 リポジトリ構成

```text
thorium-avx2-release/
├── README.md               # 英語ドキュメント
├── README_zh.md            # 繁体中国語ドキュメント
├── README_ja.md            # 日本語ドキュメント
├── SUPPORT_MATRIX.md       # 詳細な CPU・GPU 互換性表
├── INSTALL.md              # インストールおよび IME 設定ガイド
├── .gitattributes          # Git LFS 追跡ルール
├── config/args_avx2.gn     # AVX2 ビルド構成
├── packaging/              # ディストリビューション用パッケージ定義
├── patches/                # ツールチェーン分離および修正パッチ
├── packages/               # Git LFS バイナリパッケージおよび SHA256SUMS
└── scripts/                # 自動ビルドスクリプト
```
