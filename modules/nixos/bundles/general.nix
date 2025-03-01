{ pkgs, ... }:
{
  imports = [
    ../features/environment/default.nix
    ../features/grub/default.nix
    ../features/kernel/default.nix
    ../features/localization/default.nix
    ../features/nix/default.nix
    ../features/network/default.nix
    ../features/sddm/default.nix
    ../features/security/default.nix
    ../features/services/xserver.nix
    ../features/systemd/default.nix
    ../features/time/default.nix
    ../features/virtualisation/default.nix
  ];

  programs.lazygit.enable = true;
  programs.adb.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    v4l-utils
    android-tools
    adb-sync
    appimage-run
    ffmpeg-full
    mesa

    perl

    # Video/Audio data composition framework tools like "gst-inspect", "gst-launch" ...
    gst_all_1.gstreamer
    # Common plugins like "filesrc" to combine within e.g. gst-launch
    gst_all_1.gst-plugins-base
    # Specialized plugins separated by quality
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    # Plugins to reuse ffmpeg to play almost every video format
    gst_all_1.gst-libav
    # Support the Video Audio (Hardware) Acceleration API
    gst_all_1.gst-vaapi
  ];
}
