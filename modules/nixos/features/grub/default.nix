{ ... }:
{
  boot.loader = {
    # Bootloader.
    grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = false;
    };
  };
}
