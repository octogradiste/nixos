{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "Tokyo Night";
      };
      extensions = with pkgs.vscode-extensions; [
        # theme
        enkia.tokyo-night

        # vim
        vscodevim.vim

        # copilot
        github.copilot

        # python
        ms-python.python
        ms-python.vscode-pylance
        ms-toolsai.jupyter
      ];
    };
  };
}
