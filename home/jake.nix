{ inputs, pkgs, ... }:

{
  home = {
    username = "jake";
    homeDirectory = "/home/jake";
  };

  programs = {
    git = {
      enable = true;
      userName = "Jake Sykes";
      userEmail = "jakesykes@proton.me";
    };
  };
  
  home.stateVersion = "25.05";
}
