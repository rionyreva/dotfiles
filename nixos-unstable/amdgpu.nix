# amdgpu.nix

{ config, pkgs, ... }:

{

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # VULKAN is already enabled by default (using Mesa RADV) on 64 bit applications.
  # RADV 
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  # AMDVLK - The AMDVLK drivers can be used in addition to the Mesa RADV drivers. The program will choose which one to use
  # hardware.graphics.extraPackages = with pkgs; [
    # amdvlk # AMDVLK
    # rocmPackages.clr.icd # OpenCL
  # ];
  # For 32 bit applications 
  # hardware.graphics.extraPackages32 = with pkgs; [
   # driversi686Linux.amdvlk # AMDVLK 32-Bit
  # ];

  # HIP - Most software has the HIP libraries hard-coded.
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
