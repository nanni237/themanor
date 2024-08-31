{ config, pkgs, lib, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [ vim curl btop lsof wget nano fastfetch ];
    etc."themanor".source = builtins.fetchGit {
      url = "https://github.com/nanni237/themanor.git";
      ref = "refs/heads/main";
    };
  };

  networking = {
    firewall.enable = true;
    domain = "dalvarez.uk";
    usePredictableInterfaceNames = true;
  };

  services.openssh = {
      enable = true;
      ports = [ 4022 ];
      openFirewall = true;
      settings.PasswordAuthentication = false;
  };

  programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
          enable = true;
          theme = "gallifrey";
          plugins = [ "git" ];
      };
  };

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

  users.defaultUserShell = pkgs.zsh;
  users.mutableUsers = false;
  users.users = {
    admin = {
      uid = 1000;
      isNormalUser = true;
      home = "/home/admin";
      name = "admin";
      group = "admin";
      shell = pkgs.zsh;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJo7fU3Krj5P+7H8oF6DvmszRnNoNu++GX+9yc7lD/Qc"
      ];
    };
    deploy = {
      uid = 1001;
      isNormalUser = true;
      shell = pkgs.bash;
      openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB9Sz/EQGRyDpZSaPyFZiJdYzAYaychPryJMXCEPthYl"
      ];
    };
  };
  nix.settings.trusted-users = [ "deploy" ];
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "deploy" ];
        commands = [
          {
            command = "/run/current-system/sw/bin/nix-env";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/systemd-run";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
  users.groups.admin = {};
  security.sudo.wheelNeedsPassword = false;
}
