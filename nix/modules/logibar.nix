{ config, pkgs, lib, ... }: {
  users.users = {
    logibar = {
      isNormalUser = true;
      shell = pkgs.bash;
    };
  };
  services.xserver = {
    enable = true;
    displayManager = {
      autoLogin = {
        enable = true;
        user = "logibar";
      };
      gdm.enable = true;
    };
    desktopManager.gnome.enable = true;
  };
}