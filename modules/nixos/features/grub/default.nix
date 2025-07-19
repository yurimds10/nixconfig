{ lib, ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    grub = {
      enable = false;
      efiSupport = true;
      device = "nodev";
      efiInstallAsRemovable = false;
      useOSProber = false;
      gfxmodeBios = "1920x1080x32";
      gfxpayloadBios = "keep";
    };

    efi.canTouchEfiVariables = true;
  };
}
