{ config, pkgs, ... }:
{
  imports = [ ./emacs.nix ];

  environment.systemPackages = with pkgs; [
    gcc
    glibc
    clang
    cmake
    libtool
    gnumake
  ];
}
