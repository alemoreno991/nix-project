{ lib, config, ... }: 
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
    '';

    historyControl = ["erasedups" "ignorespace"];

    shellOptions = [
      "autocd"
      "cdspell"
      "cmdhist"
      "dotglob"
      "histappend"
      "expand_aliases"
    ];
    
    initExtra = ''
      eval "$(starship init bash)"
    '';
    
    shellAliases = {
      ll = "ls -lh --color=auto";
    };

  };
}
