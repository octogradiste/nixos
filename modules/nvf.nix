{...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        spellcheck.enable = true;

        lsp = {
          formatOnSave = true;
        };

        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;

          nix.enable = true;
          ts.enable = true;
          python.enable = true;
        };

        statusline = {
          lualine = {
            enable = true;
            theme = "tokyonight";
          };
        };

        theme = {
          enable = true;
          name = "tokyonight";
          style = "night";
        };

        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

        telescope.enable = true;

        git.enable = true;

        notify = {
          nvim-notify.enable = true;
        };

        assistant = {
          copilot = {
            enable = true;
            cmp.enable = true;
          };
        };
      };
    };
  };
}
