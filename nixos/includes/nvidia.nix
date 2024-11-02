{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:{
  services.xserver.videoDrivers = ["nvidia"];

   # Enable OpenGL
  hardware.opengl = {
    enable = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
