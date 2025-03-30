{
  imports = [
    ./bat.nix
    ./gpg.nix
    ./librewolf.nix # Browser
    ./obsidian.nix # Note taking app
    ./zathura.nix # Document viewer

    #--- Programming ---
    ./git.nix # Version Control System
    ./lazygit.nix # A simple terminal UI for git commands
    ./nvim # Text Editor

    #--- Desktop (i.e. window manager, app launcher, bars, style) ---
    ./desktop

    #--- Console (i.e. terminal emulator, shell, tmux, custom prompt, etc) ---
    ./console
  ];
}
