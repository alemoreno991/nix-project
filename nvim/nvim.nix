{ config, pkgs, ... }:
let 
  unstable = import (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/4aa36568d413aca0ea84a1684d2d46f55dbabad7a) { }; 
in 
{
  programs.neovim = {
    enable = true;
    package = unstable.neovim-unwrapped;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Import the neovim settings
    extraLuaConfig = builtins.readFile(./lua/settings.lua);

    plugins = with pkgs.vimPlugins; [
      vim-sleuth # Detect tabstop and shiftwidth automatically
      
      # See `:help gitsigns` to understand what the configuration keys do
      { # Adds git related signs to the gutter, as well as utilities for managing changes
        plugin = gitsigns-nvim;
        type = "lua";
        config = builtins.readFile(./plugin/gitsigns.lua);
      }

      { # Useful plugin to show you pending keybinds.
        plugin = which-key-nvim;
        type = "lua";
        config = builtins.readFile(./plugin/which-key-nvim.lua);
      }

      # File tree plugin
      nui-nvim
      plenary-nvim
      nvim-web-devicons
      { 
        plugin = neo-tree-nvim;
        type = "lua";
        config = builtins.readFile(./plugin/neo-tree-nvim.lua);
      }

      # Eyecandy
      {
        plugin = tokyonight-nvim;
        type = "lua";
        config = "
          vim.cmd.colorscheme 'tokyonight'
          vim.cmd.hi 'Comment gui=none'
        ";
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile(./plugin/nvim-treesitter.lua);
      }

      # Fuzy finder
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile(./plugin/telescope-nvim.lua);
      }


      # LSP
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile(./plugin/lsp.lua);
      }
      nvim-compe


      indentLine
      vim-nix

      {
        plugin = todo-comments-nvim;
        type = "lua";
        config = "signs = false";
      }
      
      { # Better Around/Inside textobjects
        plugin = mini-nvim;
        type = "lua";
        config = builtins.readFile(./plugin/mini.lua);
      }

      {
        plugin = copilot-lua;
        type = "lua";
        config = "require('copilot').setup({})";
      }

      dressing-nvim
      unstable.vimPlugins.render-markdown-nvim
      unstable.vimPlugins.img-clip-nvim

      {
        plugin = unstable.vimPlugins.avante-nvim;
        type = "lua";
        config = "
          -- deps:
          require('img-clip').setup ({
            -- use recommended settings from above
          })
          require('copilot').setup ({
            -- use recommended settings from above
          })
          require('render-markdown').setup ({
            -- use recommended settings from above
          })
          require('avante_lib').load()
          require('avante').setup ({
            -- Your config here!
            provider = 'copilot',
          })
        ";
      }
    ];

    extraPackages = with pkgs; [
      lua-language-server  # LSP server for lua 
      pyright              # LSP server for python 
    ];
  };

}
