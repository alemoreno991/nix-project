{
  programs.nixvim = {
    plugins.molten = {
      enable = true;

      # Configuration settings for molten.nvim. More examples at https://github.com/nix-community/nixvim/blob/main/plugins/by-name/molten/default.nix#L191
      settings = {
        auto_image_popup = false;
        auto_init_behavior = "init";
        auto_open_html_in_browser = false;
        auto_open_output = true;
        cover_empty_lines = false;
        copy_output = false;
        enter_output_behavior = "open_then_enter";
        image_provider = "none";
        output_crop_border = true;
        output_virt_lines = false;
        output_win_border = [ "" "━" "" "" ];
        output_win_hide_on_leave = true;
        output_win_max_height = 15;
        output_win_max_width = 80;
        save_path.__raw = "vim.fn.stdpath('data')..'/molten'";
        tick_rate = 500;
        use_border_highlights = false;
        limit_output_chars = 10000;
        wrap_output = false;
      };
    };

    # https://nix-community.github.io/nixvim/keymaps/index.html
    keymaps = [
      {
        mode = "n";
        key = "<localleader>mi";
        action = "<cmd>MoltenInit<CR>";
        options = {
          desc = "Initialize the plugin";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<localleader>e";
        action = "<cmd>MoltenEvaluateOperator<CR>";
        options = {
          desc = "run operator selection";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<localleader>rl";
        action = "<cmd>MoltenEvaluateLine<CR>";
        options = {
          desc = "evaluate line";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<localleader>rr";
        action = "<cmd>MoltenReevaluateCell<CR>";
        options = {
          desc = "re-evaluate cell";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<localleader>r";
        action = "<cmd><C-u>MoltenEvaluateVisual<CR>gv";
        options = {
          desc = "evaluate visual selection";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<localleader>rd";
        action = "<cmd>MoltenDelete<CR>";
        options = {
          desc = "molten delete cell";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<localleader>oh";
        action = "<cmd>MoltenHideOutput<CR>";
        options = {
          desc = "hide output";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<localleader>os";
        action = "<cmd>noautocmd MoltenEnterOutput<CR>";
        options = {
          desc = "show/enter output";
          silent = true;
        };
      }
    ];
  };
}
