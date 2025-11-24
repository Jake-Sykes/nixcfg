{ config, pkgs, ... }:

{
  programs.sway.enable = true;

  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    foot
    fuzzel
    mako
    brightnessctl
    grim
    slurp
    xfce.thunar
  ];
}
