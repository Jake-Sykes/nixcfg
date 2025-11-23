{ config, pkgs, ... }:
{
  service.emacs = {
    enable = true;
    package = pkgs.emacs;
    defaultEditor = true;
  };
}
