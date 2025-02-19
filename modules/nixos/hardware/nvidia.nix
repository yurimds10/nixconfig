{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nv-codec-headers-12

    # Vulkan
    vulkan-tools
    vulkan-loader
    vulkan-headers
    vulkan-utility-libraries
  ];

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
      forceFullCompositionPipeline = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta; # 570
    };

    nvidia-container-toolkit.enable = true;
  };
}
