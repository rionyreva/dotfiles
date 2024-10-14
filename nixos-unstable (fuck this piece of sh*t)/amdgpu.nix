{ config, pkgs, ... }:

{

  #### AMDGPU ####################################################################

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Vulkan (RADV)
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

  # OpenCL
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
    amdvlk
    driversi686Linux.amdvlk # AMDVLK for 32 bit applications
  ];

}
