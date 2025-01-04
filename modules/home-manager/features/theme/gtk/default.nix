{
  pkgs,
  ...
}: {
  gtk = {
    enable = true;

    cursorTheme.package = pkgs.capitaine-cursors-themed;
    cursorTheme.name = "Capitaine Cursors (Gruvbox) - White";

    #theme.package = pkgs.gruvbox-gtk-theme;
    #theme.name = "Gruvbox-Dark";

    iconTheme.package = pkgs.gruvbox-plus-icons;
    iconTheme.name = "Gruvbox-Plus-Dark";
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adw-gtk3";
    style.package = pkgs.libsForQt5.qtstyleplugins;
  };
}
