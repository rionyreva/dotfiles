# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./amdgpu.nix
      ./gnome.nix
      ./game.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel.
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rionyreva = {
    isNormalUser = true;
    description = "Avery Noir";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  brave # Privacy-oriented browser for Desktop and Laptop computers
  librewolf # Fork of Firefox, focused on privacy, security and freedom
  tor-browser # Privacy-focused browser routing traffic through the Tor network
  
  electron-mail # ElectronMail is an Electron-based unofficial desktop client for ProtonMail
  tutanota-desktop # Tuta official desktop client
  github-desktop # GUI for managing Git and GitHub
  
  qpwgraph # Qt graph manager for PipeWire, similar to QjackCtl
  
  keepassxc # Offline password manager with many features
  yubioath-flutter # Yubico Authenticator for Desktop
  
  rclone # Command line program to sync files and directories to and from major cloud storage
  vesktop # Alternate client for Discord with Vencord built-in
  streamcontroller # Elegant Linux app for the Elgato Stream Deck with support for plugins
  davinci-resolve-studio # Professional video editing, color, effects and audio post-processing
  yt-dlp # Command-line tool to download videos from YouTube.com and other sites (youtube-dl fork)
  vlc # Cross-platform media player and streaming server
  mpv # General-purpose media player, fork of MPlayer and mplayer2
  pixelorama # Free & open-source 2D sprite editor, made with the Godot Engine!
  kdePackages.ghostwriter # Text editor for Markdown
  kdePackages.kdenlive # Free and open source video editor, based on MLT Framework and KDE Frameworks
  kdePackages.kleopatra # Certificate manager and GUI for OpenPGP and CMS cryptography
  polari # IRC chat client designed to integrate with the GNOME desktop

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  
  # Enable Zram.
  zramSwap.enable = true;

  # Enable Flatpak.
  services.flatpak.enable = true;
  
  # Enable PCSC-Lite daemon.
  services.pcscd.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
