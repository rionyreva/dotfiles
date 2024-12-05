{ config, lib, pkgs, ... }:

{
  # The kernel can load the correct driver right away
  boot.initrd.kernelModules = [ "amdgpu" ];
  
  # Make sure Xserver uses the `amdgpu` driver in your configuration.nix
  services.xserver.videoDrivers = [ "amdgpu" ];
  
  # For ordinary desktop / gaming usage, AMD GPUs are expected to work out of the box (using Mesa RADV). As with any desktop configuration though, graphics acceleration does need to be enabled.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  # HIP
  systemd.tmpfiles.rules = 
  let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];
}
