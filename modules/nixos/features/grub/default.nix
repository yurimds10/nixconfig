{ lib, ... }:
{
  boot.loader = {
    # Bootloader.
    grub = {
      enable = lib.mkDefault true;
      device = "/dev/sda";
      useOSProber = false;
      gfxmodeBios = "1920x1080x32";
      gfxpayloadBios = "keep";
    };
  };
}
