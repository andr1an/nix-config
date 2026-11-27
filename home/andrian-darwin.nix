{
  imports = [
    ../modules/home/common
  ];

  home.stateVersion = "25.05";

  # nixpkgs' claude-code wrapper sets CLAUDE_CODE_CERT_STORE=system by default, and
  # "system" mode can't read a working trust store in that darwin build -- every API
  # call fails with a misleading "corporate SSL certificates" error. Including
  # "bundled" fixes it; "system" is kept so custom roots still apply.
  home.sessionVariables.CLAUDE_CODE_CERT_STORE = "bundled,system";

  programs.gpg.enable = true;

  programs.fish = {
    shellAliases = {
      rebuild = "sudo darwin-rebuild switch --flake ~/nix-config";
    };
  };

  home.file."ghostty" = {
    target = ".config/ghostty/config";
    source = ../config/ghostty;
  };
}
