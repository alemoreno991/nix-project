{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    obsidian
    signal-desktop
    telegram-desktop

    # CLI utils
    brightnessctl
    bottom
    cliphist
    ffmpeg
    ffmpegthumbnailer
    fzf
    git-graph
    htop
    ripgrep
    unzip
    wget
    wl-clipboard
    zip

    # Coding stuff

    # WM stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    nix-prefetch-scripts
  ];
}
