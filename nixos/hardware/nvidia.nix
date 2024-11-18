{
  config,
  pkgs,
  ...
}:{
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    # Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau
        libvdpau-va-gl 
        nvidia-vaapi-driver
        vdpauinfo
	      libva
        libva-utils
      ];
    };

    # Enable Nvidia Drivers
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.beta; # 565
    };
  };
}
