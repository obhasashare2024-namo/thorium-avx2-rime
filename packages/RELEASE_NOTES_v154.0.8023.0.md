# Thorium Browser v154.0.8023.0 (AVX2 & RIME 金色旗舰版)

High-performance Chromium build optimized specifically for **Intel Haswell/Broadwell/Skylake/Coffee Lake/Comet Lake/Raptor Lake** and **AMD Zen 1/Zen+/Zen 2/Zen 3** processors supporting **256-bit AVX2, FMA3, and BMI1/BMI2** vector instructions.

Compiled with `-march=haswell -mtune=generic -O3` using LLVM/Clang 23.0.0git, C++23, and multi-threaded ThinLTO.

> [!TIP]
> **AVX-512 Users**: If your machine features an AVX-512 capable CPU (Intel 10th/11th Gen Core, Xeon Scalable, AMD Zen 4/Zen 5), please download from the dedicated [Thorium AVX-512 Repository](https://github.com/obhasashare2024-namo/thorium-avx512-rime).

---

### 🌟 Key Highlights & Engineering Breakthroughs

1. **Chromium 154 Core Baseline (`154.0.8023.0`) + Thorium 152 Multimedia Microkernels**:
   - Modern Chromium 154 security patches, Blink layout enhancements, and Web API capabilities.
   - Ported Thorium 152 multimedia microkernels, AV1/VP9 SIMD assembly routines, and performance flags.
2. **Native 256-bit AVX2 & FMA3 Vector Acceleration**:
   - Utilizes `YMM0`~`YMM15` vector registers, FMA3 hardware math, and BMI1/BMI2 bit manipulation.
   - **Zero SIGILL risk**: 100% verified on enterprise legacy hardware (Dual Xeon E5-2696 v4).
3. **Atom Logo Rebase, Gold Icon Asset & Hardcoded Process Decoupling**:
   - Complete asset replacement with official Thorium atom icons (16x16 to 256x256), eliminating Chromium roundels.
   - Settings "About" page UI CSS fix (`#productLogo { width: 32px; height: 32px; }`).
   - Exclusive metallic gold atom icon (`thorium-gold.png`) included.
   - Kernel process locked to `thorium` via `prctl(PR_SET_NAME, "thorium")`.
   - Dedicated config paths: `~/.config/thorium` and `~/.cache/thorium`.
4. **Official Google OAuth API Keys & C++ Cookie Persistence Shield**:
   - Restores native Google Account login and Chrome Sync.
   - `0005-account-reconcilor-cookie-shield-154.patch` intercepts `AccountReconcilor::PerformLogoutAllAccountsAction` to permanently preserve cookie jar sessions across browser restarts.
5. **RIME / Fcitx5 Native Wayland & X11 IME Deep Integration**:
   - Native inline candidate box follow on Wayland (`--ozone-platform=wayland`) and X11.
   - Eliminates input focus drop and candidate drift in GNOME 46/47 and KDE Plasma 6.
6. **Widevine CDM Hardware DRM Decryption**:
   - Stream 1080p/4K content smoothly on Netflix, Spotify, Disney+, and Amazon Prime Video.

---

### 📦 Checksums (SHA-256)

```text
f4856157f2f82fe9b01dd1da8ab797aa8d487451187872bc74f463a746bd75d8  thorium-browser_154.0.8023.0_AVX2.deb
612d2d4ed6138d58deadd46322f3d2dcc2d4d32029cf3df58191867e0695b682  thorium-browser-avx2-rime-bin-154.0.8023.0-1-x86_64.pkg.tar.zst
dd2d45e17bfc4f1f29cf6f78dd6b2a7c6b3d7ab2e8def131b422f4fdb8d850e0  thorium-browser-avx2-rime-bin-154.0.8023.0-portable.tar.gz
0ca24a89340bcbace48f6b4f4ee1f71b36777d3bd2edd06a6b6591547027d321  thorium-gold.png
348665200c03e69401f55b8037940721fa1258de259d793db439f37649efef54  thorium-m154-avx2-suite.zip
```
