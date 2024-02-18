{ config, pkgs, ... }:

{
  home.username = "silverdev2482";
  home.homeDirectory = "/home/silverdev2482";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Packages

  home.packages = with pkgs; [
    prismlauncher
    gitui
    kitty
    webcord
    waybar
    dunst
    hyprpaper
    btop
    bemenu
  ];

  # Syncthing for password database
  services.syncthing.enable = true;

  # Configuration Files

  home.file = {
  };
  
  xdg.configFile = {
    "hypr/hyprland.conf".source = ./files/hyprland.conf;
    "hypr/hyprpaper.conf".source = ./files/hyprpaper.conf;
    "hypr/wallpaper.png".source = ./files/wallpaper.png;
  };

  programs.git.userEmail = "fidget1206@gmail.com";
  programs.git.userName = "silverdev2482";


  #  Source these for some reason
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
