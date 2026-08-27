# Thorium AVX2 Installation & Configuration Guide

This guide covers installing and configuring **Thorium Browser AVX2 Edition (v151.0.7922.72)** with persistent RIME input method integration and GPU hardware video decoding.

---

## 1. Installation

### Debian / Ubuntu / antiX Linux (.deb)
```bash
sudo apt update
sudo apt install -y libnss3 libatk1.0-0 libcups2 libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2
sudo dpkg -i packages/thorium-browser_151.0.7922.72_AVX2_RIME.deb || sudo apt-get -f install -y
```

### Arch Linux (.pkg.tar.zst)
```bash
sudo pacman -U packages/thorium-browser-avx2-rime-bin-151.0.7922.72-1-x86_64.pkg.tar.zst
```

---

## 2. Persistent RIME (Fcitx5 / IBus) Setup

To guarantee zero focus drop and flawless Chinese candidate positioning during long browsing sessions:

1. Add environment variables to `~/.bashrc` or `/etc/environment`:
   ```bash
   export GTK_IM_MODULE=fcitx
   export QT_IM_MODULE=fcitx
   export XMODIFIERS=@im=fcitx
   export SDL_IM_MODULE=fcitx
   export GLFW_IM_MODULE=fcitx
   ```
2. Launch Thorium with persistent Gtk3 IM context and window occlusion keepalive:
   ```bash
   thorium-browser \
     --gtk-version=3 \
     --ozone-platform=x11 \
     --enable-features=UseOzonePlatform,VaapiVideoDecodeLinuxGL \
     --disable-features=CalculateNativeWinOcclusion
   ```

---

## 3. Hardware Video Acceleration (VA-API / NVDEC)

Open `chrome://gpu` in Thorium and verify:
- **Canvas**: Hardware accelerated
- **Direct Rendering**: Yes
- **Rasterization**: Hardware accelerated
- **Video Decode**: Hardware accelerated (via VA-API / NVDEC)
