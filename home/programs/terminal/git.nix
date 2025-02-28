{...}: {
  programs.git = {
    enable = true;
    userName = "octogradiste";
    userEmail = "colin.berger@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      push.autoSetupRemote = true;
    };
  };
}
