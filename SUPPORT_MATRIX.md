# Thorium AVX2 (Haswell / Broadwell / Skylake / Zen 1-3) Hardware Support Matrix

This document provides detailed microarchitecture, instruction set, operating system, and GPU hardware acceleration compatibility specifications for **Thorium Browser AVX2 Build (v151.0.7922.72)**.

---

## 1. Supported CPU Microarchitectures

Thorium AVX2 is compiled with `-march=haswell -mtune=generic -O3` and targets processors supporting **256-bit AVX2, FMA3, and BMI1/BMI2** instructions.

| Vendor | Microarchitecture / Family | Example Processors | Status | Instruction Sets Utilized |
| :--- | :--- | :--- | :--- | :--- |
| **Intel** | **Haswell (4th Gen)** | Core i7-4770K, i7-4790K, i5-4670K | **Fully Supported** | AVX2, FMA3, BMI1, BMI2, SSE4.2 |
| **Intel** | **Broadwell (5th Gen)** | Core i7-5775C, Xeon E5-2696 v4 | **Fully Supported** | AVX2, FMA3, BMI1, BMI2, RDSEED |
| **Intel** | **Skylake / Kaby Lake (6th/7th Gen)**| Core i7-6700K, i7-7700K | **Fully Supported** | AVX2, FMA3, BMI1, BMI2, MPX |
| **Intel** | **Coffee / Comet Lake (8th~10th Gen)**| Core i9-9900K, i7-10700K | **Fully Supported** | AVX2, FMA3, BMI1, BMI2 |
| **Intel** | **Alder / Raptor / Arrow Lake** | Core i9-12900K, i7-13700K, Ultra 9 | **Fully Supported** | AVX2, FMA3, BMI1, BMI2, SHA |
| **AMD** | **Zen 1 / Zen+ (Ryzen 1000/2000)** | Ryzen 7 1800X, Ryzen 5 2600 | **Fully Supported** | AVX2, FMA3, BMI1, BMI2, SHA |
| **AMD** | **Zen 2 / Zen 3 (Ryzen 3000/5000)** | Ryzen 7 3700X, Ryzen 9 5900X | **Fully Supported** | AVX2, FMA3, BMI1, BMI2 |
| **AMD** | **Zen 4 / Zen 5 (Ryzen 7000/9000)** | Ryzen 9 7950X, Ryzen 7 9700X | **Fully Supported** | (AVX-512 build also available) |

---

## 2. GPU Hardware Acceleration Support

| GPU Vendor | Architecture | Chipset / Model | Acceleration Method | Supported Features |
| :--- | :--- | :--- | :--- | :--- |
| **Intel** | **Gen 8/9/9.5 (HD 530 / 630 / UHD)**| Core 6th~10th Gen iGPU | `iHD` (Intel Media Driver) / VA-API | H.264, HEVC 8/10-bit, VP9 Decode, 4K60 |
| **Intel** | **Xe-LP / Iris Xe** | Core 11th~13th Gen iGPU | `iHD` / VA-API | AV1, HEVC 10-bit, VP9, 8K60 Video Decode |
| **NVIDIA** | **Maxwell / Pascal / Turing** | GTX 970, GTX 1080, RTX 2060 | NVIDIA Proprietary Driver | Full WebGL 2.0, NVDEC 4K Video Offload |
| **NVIDIA** | **Ampere / Ada Lovelace** | RTX 3070, RTX 4080 | NVIDIA Proprietary Driver | WebGPU, Full Hardware Raytracing, 8K AV1 |
| **AMD** | **GCN 3+ / RDNA 1 / 2 / 3** | RX 580, RX 5700, RX 6700 XT | `radeonsi` / Mesa VA-API | Full Hardware WebGL 2.0, VA-API Decode |

---

## 3. Supported Operating Systems & Distributions

| Distribution | Version | Compatibility Level | Notes |
| :--- | :--- | :--- | :--- |
| **Debian** | 11 (Bullseye) / 12 (Bookworm) / Sid | **Tier 1 (Full)** | Native `.deb` package |
| **Ubuntu** | 20.04 LTS / 22.04 LTS / 24.04 LTS | **Tier 1 (Full)** | Native `.deb` package |
| **antiX Linux** | 21 / 22 / 23 (SysVinit / Runit) | **Tier 1 (Full)** | Systemd-free optimized |
| **Arch Linux** | Rolling Release / Artix / Manjaro | **Tier 1 (Full)** | Native `PKGBUILD` / `.pkg.tar.zst` |
