{ ...}:
{
  networking = {
    hostName = "nixos";
    nameservers = [
      # QUAD9
      "9.9.9.9"
      "149.112.112.112"
      "2620:fe::fe"
      "2620:fe::9"  
    ]; 
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
    };
  };
}
