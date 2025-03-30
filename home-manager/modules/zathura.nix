# https://github.com/pwmt/zathura
#
# zathura is a highly customizable and functional document viewer based on the
# girara user interface library and several document libraries.
{
  programs.zathura = {
    enable = true;
    mappings = {
      D = "toggle_page_mode";
      d = "scroll half_down";
      u = "scroll half_up";
    };
    options = {
      font = "JetBrains Mono Bold 13";
    };
  };
}
