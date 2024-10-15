## System

sudo zypper dup
sudo zypper install firewall-config gparted distrobox podman toolbox 

solaar-udev
## AMD
sudo zypper install Mesa-libRusticlOpenCL libvulkan_radeon

## Zram
sudo zypper in systemd-zram-service 

systemctl enable --now zramswap.service 

## rclone
sudo zypper install rclone
rclose config

### Brave Beta

sudo zypper install curl

sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc

sudo zypper addrepo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo

sudo zypper install brave-browser-beta

## Opi
sudo zypper install opi
- opi codecs

## Flatpak
sudo zypper install flatpak flatpak-builder


https://flathub.org/apps/org.keepassxc.KeePassXC
flatpak install flathub org.keepassxc.KeePassXC

https://flathub.org/apps/com.hunterwittenborn.Celeste
flatpak install flathub com.hunterwittenborn.Celeste
