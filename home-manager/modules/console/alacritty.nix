# Alacritty is a modern terminal emulator that comes with sensible defaults,
# but allows for extensive configuration. By integrating with other
# applications, rather than reimplementing their functionality, it manages
# to provide a flexible set of features with high performance. The supported
# platforms currently consist of BSD, Linux, macOS and Windows.
{
  lib,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
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
