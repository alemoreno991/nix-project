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

  # Impermanence settings.
  #
  # WARN: by default the `/home/<user>` uses tmpfs (i.e. lives in RAM).
  # These are the user directories that will be bind mounted to a hard-drive.
  home.persistence."/nix/persist/home/alejandro" = {
    directories = [
      "Documents"
      "Downloads"
      "Zotero"
      ".cache/bazel"
      ".ssh"
      ".librewolf"
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
