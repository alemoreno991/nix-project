{
  lib,
  config,
  ...
}: {
  imports = [
    ./hyprland # Window manager
    ./stylix.nix # Style manager
    ./swaync #
    ./waybar # Menu bar
    ./wofi # App launcher
  ];
}
