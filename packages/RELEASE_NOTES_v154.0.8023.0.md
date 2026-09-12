# Thorium Browser v154.0.8023.0 (AVX2 & RIME 旗舰版)

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
3. **Deep-Purple Lightning Logo & Atom Branding Integration**:
   - Complete icon suite refresh featuring user-approved deep-purple lightning branding across all Linux desktop icon tiers (16x16 through 512x512, PNG & SVG).
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
a91088ff05de110006ef64994d4281f5d38932b3a035d474539aae3c0915c52c  thorium-browser_154.0.8023.0_AVX2.deb
697e246a9981cf477f1eddcc7683213862c33cabd0ec79896326ac5f4f7cd253  thorium-browser-avx2-rime-bin-154.0.8023.0-1-x86_64.pkg.tar.zst
12e63ffefb04681a0db59a1266d7f25c9c2fbc6498204bae5ecf7d3fc5498d84  thorium-browser-avx2-rime-bin-154.0.8023.0-portable.tar.gz
348665200c03e69401f55b8037940721fa1258de259d793db439f37649efef54  thorium-m154-avx2-suite.zip
1f248d1baacb26d0ba769d90116bd7784b8c3ac8e5f823fb25634f3778968d53  thorium-purple-lightning.png
```
