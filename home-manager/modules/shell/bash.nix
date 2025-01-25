#########################################################################################
# Bash configuration
# 
# Author: Alejandro Moreno
#########################################################################################
# Reference:
# - https://mynixos.com/home-manager/options/programs.bash
#----------------------------------------------------------------------------------------
{ lib, config, ... }: 
{
  programs.bash = {
    enable = true;

    # Extra commands that should be placed in ~/.bashrc
    bashrcExtra = ''
      # Allow fzf to explore the history for matching commands
      # USAGE: press 'Ctrl+R' after typing the first part of the command you desire
      if command -v fzf-share >/dev/null; then
        source "$(fzf-share)/key-bindings.bash"
        source "$(fzf-share)/completion.bash"
      fi
    '';

    #----- Controlling how commands are saved on the history list
    #
    # ignoredups: don't add a command to history if it's the same as the inmmediate
    #            previous command (it doesn't look further back in the history list).
    #
    # ignorespace: causes lines which begin with a white space character to not be 
    #              included in the history list.
    #
    # erasedups: the history after this command is used will not store any duplicate 
    #            element
    historyControl = ["erasedups" "ignorespace"];
    
    #----- Location of the bash histroy file
    historyFile = "${config.xdg.dataHome}/bash/history";
    
    #----- Extra commands that should be run when initializing an interactive shell
    initExtra = ''
      # Start Tmux automatically if not already running. No Tmux in TTY
      if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
        tmux attach-session -t default || tmux new-session -s default
      fi

      # Start UWSM
      if uwsm check may-start > /dev/null && uwsm select; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi
    '';

    #----- Extra commands that should be run when initializing a login shell
    profileExtra = ''
      TERM="alacritty";
    '';

    #----- An attribute set that maps aliases to command string 
    shellAliases = 
      let
        flakeDir = "~/flake";
      in {
        sw = "nh os switch";
        upd = "nh os switch --update";
        hms = "nh home switch";

        pkgs = "nvim ${flakeDir}/nixos/packages.nix";

        r = "ranger";
        v = "nvim";
        se = "sudoedit";
        microfetch = "microfetch && echo";

        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";

        # ll = "ls -lh --color=auto";
        ".." = "cd ..";
      };

    #----- Shell options to set
    # An explanation of the possible options can be found here:
    # https://bash-hackers.gabe565.com/internals/shell_options/
    shellOptions = [
      "autocd"
      "cdspell"
      "cmdhist"
      "dotglob"
      "histappend"
    ];
  };
}
