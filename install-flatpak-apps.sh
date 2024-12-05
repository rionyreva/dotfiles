#!/bin/bash

# List of applications to install. Specify multiple packages in a new line.
apps=(
  com.github.tchx84.Flatseal
  io.github.giantpinkrobots.flatsweep
  # org.keepassxc.KeePassXC
  # com.tutanota.Tutanota
  # io.github.shiftey.Desktop
  # com.brave.Browser
  # io.gitlab.librewolf-community
  # org.torproject.torbrowser-launcher
  # dev.vencord.Vesktop
  # com.modrinth.ModrinthApp
  # org.prismlauncher.PrismLauncher
	
	# Jagex Launcher
	# This repo in automatically added via flatpak.nix file!
	# flatpak remote-add --if-not-exists JagexLauncher https://jagexlauncher.flatpak.mcswain.dev/JagexLauncher.flatpakrepo
	# org.freedesktop.Platform.Compat.i386/x86_64/23.08
	# org.freedesktop.Platform.GL32.default/x86_64/23.08
	# com.jagex.Launcher
	# com.jagex.Launcher.ThirdParty.RuneLite
)

# Install each application system-wide.
for app in "${apps[@]}"; do
  flatpak install --system "$app" -y
done
