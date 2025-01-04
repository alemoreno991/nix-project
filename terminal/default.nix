{ lib, config, ... }: 
{
  imports = [
    ./alacritty.nix
    ./tmux.nix
  ];
}
