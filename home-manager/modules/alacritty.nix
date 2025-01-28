{ lib, pkgs, ... }: {

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;

      font = {
        builtin_box_drawing = true;
        normal = {
          family = lib.mkForce "JetBrainsMono Nerd Font Mono";
          style = lib.mkForce "Bold";
        };
      };
    };
  };
}
