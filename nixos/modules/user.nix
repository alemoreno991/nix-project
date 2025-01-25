{ pkgs, user, ... }: {
  users = {
    defaultUserShell = pkgs.bash;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  services.getty.autologinUser = user;
}
