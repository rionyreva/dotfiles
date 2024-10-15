#!/bin/bash

# Install Flatpak if not already installed
if ! command -v flatpak &> /dev/null; then
  sudo zypper -y dup
  sudo zypper install -y flatpak
fi

# Add Flathub repository if not already added.
if ! flatpak remote-list | grep -q flathub; then
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# List of applications to install. Specify multiple packages in a new line.
apps=(
  com.mattjakeman.ExtensionManager
  com.brave.Browser
  io.gitlab.librewolf-community
  org.torproject.torbrowser-launcher
  org.onionshare.OnionShare
  org.qbittorrent.qBittorrent
  dev.vencord.Vesktop
  com.valvesoftware.Steam
  com.valvesoftware.SteamLink
  flathub net.davidotek.pupgui2
  flathub net.lutris.Lutris
  com.github.k4zmu2a.spacecadetpinball
  org.keepassxc.KeePassXC
  com.yubico.yubioath
  com.pokemmo.PokeMMO
  io.bassi.Amberol
  ca._0ldsk00l.Nestopia
  com.snes9x.Snes9x
  com.github.Rosalie241.RMG
  org.duckstation.DuckStation
  net.pcsx2.PCSX2
  io.github.shiftey.Desktop
  com.usebottles.bottles
  org.kde.kdenlive
  org.videolan.VLC
  io.mpv.Mpv
  com.makemkv.MakeMKV
  com.heroicgameslauncher.hgl
  org.prismlauncher.PrismLauncher
  network.loki.Session
  com.ktechpit.whatsie
  io.github.zaedus.spider
  com.core447.StreamController
  org.filezillaproject.Filezilla
  uk.org.greenend.chiark.sgtatham.putty
  org.gimp.GIMP
  org.blender.Blender
  org.gnome.Shotwell
  com.orama_interactive.Pixelorama
  org.leocad.LeoCAD
  com.obsproject.Studio
  com.obsproject.Studio.Plugin.CompositeBlur
  com.obsproject.Studio.Plugin.VerticalCanvas
  com.obsproject.Studio.Plugin.OBSLivesplitOne
  com.obsproject.Studio.Plugin.DroidCam
  org.pulseaudio.pavucontrol
  org.bunkus.mkvtoolnix-gui
  com.github.tchx84.Flatseal
  io.github.giantpinkrobots.flatsweep
  com.modrinth.ModrinthApp
  org.cryptomator.Cryptomator
  me.proton.Mail
  com.tutanota.Tutanota
  org.mozilla.Thunderbird
  nz.mega.MEGAsync
  io.github.nokse22.teleprompter
  org.kde.ghostwriter
  io.podman_desktop.PodmanDesktop
  com.dropbox.Client
  io.github.dosbox-staging
  org.gnome.Fractal
  vet.rsc.OpenRSC.Launcher
  io.github.pwr_solaar.solaar
  net.puddletag.puddletag
  org.gnome.Boxes
)

# Install each application
for app in "${apps[@]}"; do
  flatpak install --system flathub "$app" -y
done
