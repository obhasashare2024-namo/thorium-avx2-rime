<p align="center">
  <img src="assets/thorium-purple-lightning.png" width="220" alt="Thorium Browser Emblem">
</p>

# Thorium Browser 154（Chromium 154.0.8023.0 + Thorium 152 ハイブリッド AVX2 旗艦版）- RIME IME統合＆ハードウェア動画デコード

[![リリース](https://img.shields.io/badge/リリース-v154.0.8023.0-blue.svg)](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/tag/v154.0.8023.0)
[![アーキテクチャ](https://img.shields.io/badge/アーキテクチャ-AVX2%20%2B%20FMA3%20(Haswell)-green.svg)](SUPPORT_MATRIX.md)
[![SIMD](https://img.shields.io/badge/SIMD-256--bit%20YMM-orange.svg)](SUPPORT_MATRIX.md)
[![IME](https://img.shields.io/badge/IME-RIME%20%2F%20Fcitx5%20(Ozone%20Wayland)-yellow.svg)](#4-rime--fcitx5-ネイティブ-wayland--x11-ime-統合)
[![DRM](https://img.shields.io/badge/Widevine%20DRM-4.10.3050.0-purple.svg)](#5-widevine-cdm-保護ストリーミング再生)
[![ライセンス](https://img.shields.io/badge/ライセンス-BSD--3--Clause-lightgrey.svg)](LICENSE)
[![AVX-512 旗艦版](https://img.shields.io/badge/AVX--512%20旗艦版-こちらへ-brightgreen.svg)](https://github.com/obhasashare2024-namo/thorium-avx512-rime)

[English](README.md) | [繁體中文](README_zh.md) | [日本語](README_ja.md) | [ハードウェア互換性表](SUPPORT_MATRIX.md) | [インストールガイド](INSTALL.md)

---

## 概要

**Thorium Browser 154（AVX2 專用旗艦版）** は、**256 ビット AVX2、FMA3、および BMI1/BMI2 拡張命令セット** をサポートする主流の x86-64 プロセッサ向けに最適化された高性能ビルドです。最新の **Chromium 154 コア（`154.0.8023.0`）** に、**Thorium 152 の高性能マルチメディアマイクロカーネル、AV1/VP9 アセンブラ最適化、および低レイヤコンパイラフラグ** を完全統合しています。

`-march=haswell -mtune=generic -O3`、LLVM/Clang 23.0.0git、C++23、およびマルチスレッド ThinLTO（リンク時最適化）を適用し、DOM レンダリング、WebAssembly、V8 JIT ベクトル演算を劇的に高速化。旧型エンタープライズサーバーやデスクトップでの命令例外（`SIGILL`）リスクを完全に排除し、永続的な RIME 日本語・中国語入力と 4K/8K ハードウェア動画デコードを提供します。

> [!NOTE]
> **AVX-512 対応 CPU をお使いの方へ**：お使いのプロセッサが 512 ビットベクトル命令に対応している場合（Intel 第10/11世代 Core、Xeon Scalable、AMD Zen 4/5 など）、32 本の 512 ビット ZMM レジスタをフル活用できる [Thorium AVX-512 リポジトリ](https://github.com/obhasashare2024-namo/thorium-avx512-rime) をご利用ください。

---

## 🌟 M154 ハイブリッドバージョンの主な特徴と技術ハイライト

### 1. Chromium 154 コア基盤 + Thorium 152 SIMD ハイブリッドアーキテクチャ
- **Chromium 154 コア更新**：ベースラインを `154.0.8023.0` に引き上げ、上流のセキュリティ強化、最新 Web API、洗練された Blink レイアウト性能を導入。
- **Thorium 152 マルチメディア最適化の移植**：Thorium 独自の高効率マルチメディアコーデック、AV1/VP9 SIMD アセンブラルーチン、最適化ビルドフラグを完全移植。
- **Clang 23.0 + C++23 ThinLTO**：モジュール間リンク時最適化により、バイナリサイズを最小限（パッケージサイズ約 227 MB）に圧縮。

### 2. AVX2 ＆ FMA3 専用ベクトルパイプライン（`-march=haswell`）
- `haswell` アーキテクチャを対象とし、Intel 第4世代 Haswell から第14世代 Raptor Lake、Xeon E3/E5 v3/v4、および AMD Ryzen 1000〜5000（Zen 1〜3）を完全カバー。
- 256 ビット `YMM` ベクトルレジスタ（`YMM0`〜`YMM15`）、積和演算命令（`FMA3`）、ビット操作命令（`BMI1`, `BMI2`）を駆使。
- デュアル Intel Xeon E5-2696 v4（21号機）にて実機検証完了、`SIGILL` 不正命令クラッシュゼロを確認済み。

### 3. 公式アトムロゴ Rebase、ゴールドアイコン＆プロセス完全分離（`thorium`）
PID 衝突、単一インスタンスロック競合（`SingletonLock`）、およびシステム側 Chromium や `webllm-farm` との干渉を根本解消：
- **公式アトムロゴの完全適用**：すべてのアイコンリソースを Thorium 公式アトムロゴ（16x16 〜 256x256）に置き換え、Chromium 丸型アイコンを完全排除。
- **About ページの UI スケール修正**：CSS `#productLogo { width: 32px; height: 32px; }` を適用しロゴ巨大化を防止。多言語ブランディング文字列を完備。
- **専用ゴールドアトムアイコン**：金属質感のゴールドアイコン（`assets/thorium-gold.png`）を同梱し、ファーム緑・標準紫プロファイルと即座に視覚識別可能。
- **カーネルプロセス名のハードニング**：バイナリ出力を `thorium` に固定し、`prctl(PR_SET_NAME, "thorium")` により `/proc/$PID/comm` を `thorium` に厳密固定。
- **独立した設定およびキャッシュディレクトリ**：`~/.config/thorium` および `~/.cache/thorium` を排他的に使用。
- **ウィンドウ識別子**：`StartupWMClass=thorium-browser`。

### 4. 公式 Google OAuth API 認証情報＆C++ Cookie 永続保護シールド
- **Google API キー内蔵**：ネイティブな Google アカウントログインおよび Chrome クラウド同期を復元。
- **`0005-account-reconcilor-cookie-shield-154.patch`**：Chromium 154 で改訂された `GoogleServiceAuthError` API に適応。`AccountReconcilor::PerformLogoutAllAccountsAction` を遮断し、ブラウザ再起動後も **Google アカウントが 100% ログイン状態を維持**。

### 5. RIME / Fcitx5 ネイティブ Wayland ＆ X11 IME 統合
- `--ozone-platform=wayland` および `WAYLAND_IM_MODULE=fcitx5` に完全対応、X11 への自動フォールバックも装備。
- GNOME 46/47 Mutter および KDE Plasma 6 KWin における候補ウィンドウの追従遅延・焦点喪失を根本解決。
- 動的な DBus セッションバスおよび Xauthority の自動検出。

### 6. Widevine CDM 保護ストリーミング再生
- `libwidevinecdm.so` モジュール登録と動的 CDM アダプタを統合。
- Netflix、Spotify、Disney+、Amazon Prime Video での 1080p/4K DRM 再生を実機検証済み。

### 7. 互換性およびツールチェーンパッチ
- **`0001-toolchain-segregation-avx2.patch`**：ターゲットフラグを `clang_x64_target` に分離し、異種ビルド機でのジェネレータクラッシュを防止。
- **`0006-signin-dbsc-buildflag-guard.patch`**：DBSC 登録を `#if BUILDFLAG(ENABLE_DEVICE_BOUND_SESSIONS)` で保護し、未定義シンボルエラーを解消。
- **`0007-crubit-rust-integrity-parser-fix.patch`**：Crubit Rust-C++ FFI パーサー結果の処理を修正。
- **`0008-thorium-m154-decoupling-and-packaging.patch`**：Debian、Arch Linux（`makepkg`）、ポータブル版にまたがる総合パッケージングおよびブランド分離パッチ。

---

## 📦 リリースファイル一覧と SHA-256 チェックサム

| パッケージ名 | 配布形式 | SHA-256 チェックサム |
| :--- | :--- | :--- |
| [`Thorium_macOS_x64_AVX2.dmg`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/Thorium_macOS_x64_AVX2.dmg) | macOS ディスクイメージ（Intel AVX2、Ventura/Sonoma/Sequoia） | `c245c71bf49194d9fbf37cc03b9eb74c4491aa305a8391cc75b171d96677cdbd` |
| [`Thorium_AVX2_154.0.8023.0_WIN64_Portable.zip`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/Thorium_AVX2_154.0.8023.0_WIN64_Portable.zip) | Windows 64-bit AVX2 ポータブル版アーカイブ | `951bfbd13b405c390b8026325eb626f21a0f6de025fac9013f2c941637e024af` |
| [`thorium-browser_154.0.8023.0_AVX2.deb`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/thorium-browser_154.0.8023.0_AVX2.deb) | Debian / Ubuntu / Deepin / antiX | `f4856157f2f82fe9b01dd1da8ab797aa8d487451187872bc74f463a746bd75d8` |
| [`thorium-browser-avx2-rime-bin-154.0.8023.0-1-x86_64.pkg.tar.zst`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/thorium-browser-avx2-rime-bin-154.0.8023.0-1-x86_64.pkg.tar.zst) | Arch Linux / CachyOS / Artix | `612d2d4ed6138d58deadd46322f3d2dcc2d4d32029cf3df58191867e0695b682` |
| [`thorium-browser-avx2-rime-bin-154.0.8023.0-portable.tar.gz`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/thorium-browser-avx2-rime-bin-154.0.8023.0-portable.tar.gz) | 汎用 Linux ポータブル版 | `dd2d45e17bfc4f1f29cf6f78dd6b2a7c6b3d7ab2e8def131b422f4fdb8d850e0` |
| [`thorium-purple-lightning.png`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/thorium-purple-lightning.png) | 公式高精度標準円紫雷エンブレム | `33973827dfb7ce1a23efa72e69c0d357502af299562d7bf97934f16b830e57a2` |
| [`thorium-m154-avx2-suite.zip`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/thorium-m154-avx2-suite.zip) | パッチ、設定ファイル、ビルドスクリプト一式 | `348665200c03e69401f55b8037940721fa1258de259d793db439f37649efef54` |
| [`SHA256SUMS.txt`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/SHA256SUMS.txt) | リリース検証用チェックサムファイル | 全ファイルチェックサム |

---

## 🚀 インストールと起動手順

### macOS インストール手順（.dmg）：
1. [`Thorium_macOS_x64_AVX2.dmg`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/Thorium_macOS_x64_AVX2.dmg) をダウンロードします。
2. ディスクイメージをダブルクリックしてマウントします（カスタム紫雷アイコンが表示されます）。
3. `Thorium.app` を `Applications` フォルダショートカットへドラッグ＆ドロップします。
4. Gatekeeper で開発者警告が表示される場合は、ターミナルで以下を実行します：
   ```bash
   xattr -cr /Applications/Thorium.app
   ```
5. Launchpad またはターミナルから `Thorium.app` を直接起動します。設定データは `~/Library/Application Support/Thorium` に完全分離されます。

### Windows 64-bit ポータブル版（Portable）：
1. [`Thorium_AVX2_154.0.8023.0_WIN64_Portable.zip`](https://github.com/obhasashare2024-namo/thorium-avx2-rime/releases/download/v154.0.8023.0/Thorium_AVX2_154.0.8023.0_WIN64_Portable.zip) をダウンロードします。
2. 任意のフォルダに展開します。
3. `BIN/thorium.exe` を起動します。プロファイルデータは `USER_DATA/` に自動隔離されます。

### Debian / Ubuntu / antiX Linux（.deb）：
```bash
sudo apt update && sudo apt install -y libnss3 libatk1.0-0 libcups2 libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2
sudo dpkg -i packages/thorium-browser_154.0.8023.0_AVX2.deb || sudo apt-get -f install -y
```

### Arch Linux / Artix Linux（.pkg.tar.zst）：
```bash
sudo pacman -U packages/thorium-browser-avx2-rime-bin-154.0.8023.0-1-x86_64.pkg.tar.zst
```

### 汎用ポータブル版（Portable）：
```bash
tar -xzf packages/thorium-browser-avx2-rime-bin-154.0.8023.0-portable.tar.gz
cd thorium-browser-avx2-rime-bin-154.0.8023.0-portable/bin
./thorium
```

---

## 📊 ベンチマーク測定結果

| 測定項目 | テスト環境 | ワークロード | 実測値 |
| :--- | :--- | :--- | :--- |
| **V8 エンジン演算スループット** | AVX2（デュアル Xeon E5-2696 v4） | Float64 行列乗算 (200x200) + Mandelbrot + 30k JSON | **`212.80 ms`** |
| **コールドスタート遅延** | AVX2（Haswell） | ヘッドレスコールド起動から DOM Ready まで | **`1195 ms`** |
| **Wayland IME 遅延** | AVX2（Fcitx5 / RIME） | 候補ウィンドウポップアップ遅延 | **`< 2 ms`（ドリフトゼロ）** |

---

## ライセンス

BSD-3-Clause License。Chromium ソースコードは Chromium 作者のライセンス条項に準拠します。
