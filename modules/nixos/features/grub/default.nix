{ lib, ... }:
{
  boot.loader = {
    # Bootloader.
    grub = {
      enable = lib.mkDefault true;
      device = "/dev/sda";
      useOSProber = false;
    };
  };
}
