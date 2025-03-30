{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./home-packages.nix
    ./modules
  ];

  #  # Home Manager needs a bit of information about you and the
  #  # paths it should manage.
  #  home.username = "alejandro";
  #  home.homeDirectory = "/home/alejandro";

  home.persistence."/nix/persist/home/alejandro" = {
    directories = [
      "Documents"
      "Downloads"
      "Zotero"
      #      ".gnupg"
      ".ssh"
      ".librewolf"
      #      ".local"
      #      ".config"
    ];
    files = [
      ".bash_history"
      ".config/sops/age/keys.txt"
    ];
    allowOther = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
