{ config, pkgs, ... }:
{
  programs.nix-ld.enable = true;
  # Optional: Add common libraries needed by many binaries
  programs.nix-ld.libraries = with pkgs; [
    # Basic libraries
    glib
    nss
    openssl
    stdenv.cc.cc.lib
    curl
    zlib
    # Add more as needed (e.g., GTK, QT, etc.)
  ];
}
