{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  users.users = {
    yurimds = {
      isNormalUser = true;
      description = "Yuri Mendes";
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [];

      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "video"
      ];
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };
}
