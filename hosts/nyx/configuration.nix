{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nyx";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.session = [
    { manage = "window";
      name = "EXWM";
      start = ''
        exec emacs
      '';
    }
  ];
  services.xserver.desktopManager.xfce.enable = true;


  services.xserver.xkb = {
    layout = "gb";
    variant = "colemak_dh";
    options = "ctrl:nocaps";
  };

  console = {
    useXkbConfig = true;
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig = {
      pipewire."99-silent-bell.conf" = {
        "context.properties" = {
          "module.x11.bell" = false;
        };
      };
    };
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  
  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
    };
  };

  users.users.jake = {
    isNormalUser = true;
    description = "Jake Sykes";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      librewolf
      google-chrome
      brightnessctl
    ];
  };

  nixpkgs.config.allowUnfree = true;
 
  environment.systemPackages = with pkgs; [
    emacs
    vim
    wget
    git
    tree
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
