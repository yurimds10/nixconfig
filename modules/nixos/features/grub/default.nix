{ inputs, ... }:
{
  imports = [ inputs.grub2-themes.nixosModules.default ];

  boot.loader = {
    grub2-theme = {
      enable = true;
      theme = "vimix";
      footer = true;
    };
    # Bootloader.
    grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = false;
    };
  };
}
