{ config, inputs, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nix/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    emacs = "emacs";
    sway = "sway";
    fuzzel = "fuzzel";
    foot = "foot";
  };
in
{
  home = {
    username = "jake";
    homeDirectory = "/home/jake";
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;
  
  programs = {
    bash = {
      enable = true;
      bashrcExtra = ''
        export GTK_THEME=Adwaita:dark  
      '';
    };
    
    git = {
      enable = true;
      userName = "Jake Sykes";
      userEmail = "jakesykes@proton.me";
    };
  };
  home.stateVersion = "25.05";
}
