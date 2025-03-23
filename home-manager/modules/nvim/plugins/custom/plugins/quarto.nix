{
  programs.nixvim = {
    plugins.quarto = {
      enable = true;

      settings = {
        lspFeatures = {
          enabled = true;
          languages = [ 
            "python"
          ];

          chunks = "all";

          diagnostics = {
            enabled = true;
            triggers = [ 
              "BufWritePost" 
            ];
          };

          completion.enabled = true;
        };

        keymap = {
          # NOTE: setup your own keymaps:
          hover = "H";
          definition = "gd";
          rename = "<leader>rn";
          references = "gr";
          format = "<leader>gf";
        };

        codeRunner = {
          enabled = true;
          default_method = "molten";
        };
      };
    };
  };
}
