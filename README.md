# ◆ Bare Metal

A purpose-built Unix environment for embedded systems, robotics, and C/C++ development — running on a Raspberry Pi 5 inside a Pironman 5 case with NVMe SSD.

**[→ View Project Site](https://gtullio12.github.io/bare-metal)**

---

## Hardware

| Component | Details |
|-----------|---------|
| SBC | [Raspberry Pi 5 8GB](https://www.amazon.com/Raspberry-Pi-8GB-SC1112-Quad-core/dp/B0CK2FCG1K/ref=pd_bxgy_thbs_d_sccl_1/134-7396949-5223443?pd_rd_w=z8fw7&content-id=amzn1.sym.9bef5913-5870-4504-8883-3ba89d7f8e39&pf_rd_p=9bef5913-5870-4504-8883-3ba89d7f8e39&pf_rd_r=1TRGYD2QJQP84Z3P0MAR&pd_rd_wg=fkiSa&pd_rd_r=2fc3a984-0a0b-49d4-b63d-69e027ccd642&pd_rd_i=B0CK2FCG1K&psc=1) |
| RAM | 8 GB LPDDR4X |
| Storage | 256 GB NVMe SSD (PCIe) |
| Case | [Pironman 5](https://www.amazon.com/Pironman-Raspberry-Shutdown-Standard-Performance/dp/B0D5CTRSQK/ref=sr_1_3?dib=eyJ2IjoiMSJ9.QhqFIzi7YcXGAY75RnPaFaclyKUHCi34S2MX5omGF0xfLmD_H4gRYgkWSg4fXiwW46KU5JUQrgdfa5XtMw_jYbYl1UI4Pr95aHWd3SzhLrV5pN-YuoDCocAZ4n_Yb-tyfqSgyD7zQeuhf66GpaZetcc-5iOXHZeKOhVOcXawlVEW7cQRzAdn6fAsCy5NAcT3Z8zltXQSZ5q6tadDhlNN5N-7DOW59EW-puW_UJaJr5k.VFN-OCHRDcVaFHuXtq-CMzfOp7uJil0eGEIiWK0T7Kw&dib_tag=se&keywords=iron+man+5&qid=1779742137&sr=8-3) |
| Power Supply | [RasTech 27W USB-C](https://www.amazon.com/RasTech-Power-Supply-Raspberry-Adapter/dp/B0CLV6WB4L/ref=pd_bxgy_d_sccl_2/134-7396949-5223443?pd_rd_w=Sxtas&content-id=amzn1.sym.9bef5913-5870-4504-8883-3ba89d7f8e39&pf_rd_p=9bef5913-5870-4504-8883-3ba89d7f8e39&pf_rd_r=M5NVZ4VWSW95QEGA0538&pd_rd_wg=ut7p3&pd_rd_r=69c7099a-c1d3-4263-880c-398269d65363&pd_rd_i=B0CLV6WB4L&psc=1) |
| WiFi Adapter | [BrosTrend AC2 600Mbps](https://www.amazon.com/BrosTrend-600Mbps-Wireless-Internet-AC2/dp/B01GC8XH0S/ref=sr_1_6?crid=22E7237RSCKMN&dib=eyJ2IjoiMSJ9.78-l3ki-Cdgk66rHmmKHex9KhTpzBHPXT2D8u3TECxjwzBFEDAmZ57AABWmAgf8e35XbGcyCmhG8euMjGNKjpcWS3m6eJYloqHoBun8etnsv3xFVgnLC2ZJUR9uCrhhG3ys7MUriYrZZCJWXHAIyIuVVyPolPhhQi-K5SGq8pge7kT2DN7g40DL5NUQk1ttY7OW0M0c7iugrxMYpsr1Q0v2Oaps-UN90fKx76SBaZ1U.o8VJrwi-7vq3XYa76lgDRHGQVWMR6_mKb10boH9a0gw&dib_tag=se&keywords=linux+wifi+adapter&qid=1779741318&sprefix=linux+wifi+ada%2Caps%2C347&sr=8-6) |
| OS | Raspberry Pi OS Bookworm (64-bit) |
| Keyboard | [System76 Launch](https://system76.com/keyboards/launch) (open source) |

---

## Software Stack

| Tool | Purpose |
|------|---------|
| [i3](https://i3wm.org/) | Tiling window manager |
| [Neovim](https://neovim.io/) | Editor — configured for C/C++, Python, embedded dev |
| [Alacritty](https://alacritty.org/) | GPU-accelerated terminal |
| [Polybar](https://github.com/polybar/polybar) | Status bar |
| [Ranger](https://ranger.github.io/) | Terminal file manager |
| [Rofi](https://github.com/davatorium/rofi) | App launcher |
| [Dracula](https://draculatheme.com/) | Color scheme |

---

## Repo Structure

```
bare-metal/
├── configs/
│   ├── i3/           # i3 window manager config
│   ├── alacritty/    # terminal config (Dracula theme)
│   ├── polybar/      # status bar config + launch script
│   ├── ranger/       # file manager config
│   ├── nvim/         # neovim config (lazy.nvim + LSP)
│   └── flashfocus/   # window focus flash effect
├── bashrc            # bash aliases and git shortcuts
└── docs/             # project website (GitHub Pages)
    ├── index.html
    ├── reference.html
    └── images/
```

---

## Usage

This is a personal configuration repo, not a one-click installer. The setup has hardware-specific quirks (OpenGL version, display manager config, network interface names) that make a generic install script unreliable.

If you want to use any of these configs, copy the relevant files from `configs/` to `~/.config/` and adapt as needed. The [reference page](https://gtullio12.github.io/bare-metal/reference.html) documents all keybindings and commands.

---

## Notes

- Kitty terminal was replaced with Alacritty — the Pi 5's GPU (V3D/Mesa) only supports OpenGL 3.1, below Kitty's 3.3 requirement
- Picom compositor was removed — the xrender backend caused slowdowns on the Pi 5's shared GPU
- Background is set with `hsetroot` rather than nitrogen/feh
