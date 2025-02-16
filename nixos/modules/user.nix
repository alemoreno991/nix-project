{ pkgs,  ... }:
let
  user = "alejandro";
in
{
  users = {
    defaultUserShell = pkgs.bash;
    users.${user}= {
      isNormalUser = true;
      initialPassword = "123456";
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  services.getty.autologinUser = user;
}
