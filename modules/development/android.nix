{ config, pkgs, pkgs-stable, ... }:

{
  # this is stupid i think
  environment.systemPackages = with pkgs-stable; [
    android-studio
  ];
}
