{
  lib,
  config,
  ...
}: {
  imports = [
    ./alacritty.nix # Terminal emulator
    ./bash.nix # Shell
    ./eza.nix # A modern alternative to ls
    ./ranger.nix # File manager
    ./starship.nix # Customized shell prompt
    ./tmux.nix # Terminal multiplexer
  ];
}
