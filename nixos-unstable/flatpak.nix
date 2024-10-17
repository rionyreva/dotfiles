# flatpak.nix

{ config, pkgs, lib, ... }:

{

	# Enable flatpak.
	
	services.flatpak.enable = true;
	environment.systemPackages = [ pkgs.flatpak-builder ];

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  
  systemd.services.jagex-launcher-flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists JagexLauncher https://jagexlauncher.flatpak.mcswain.dev/JagexLauncher.flatpakrepo
    '';
  };
  
}
