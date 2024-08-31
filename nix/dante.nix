{ modulesPath, config, pkgs, lib, ... }: {
  imports = [
    ./hardware/idk.nix
    ./modules/base.nix
    ./modules/k8s/hc/master-node.nix
  ];

  networking = {
    hostName = "dante";
    extraHosts = "192.168.0.3 api.kube";
    hostId = "7352082e";
    interfaces.enp3s0 = {
      ipv4.addresses = [{
       address = "192.168.0.3";

       prefixLength = 24;
      }];
    };
    defaultGateway = "192.168.0.1";
    nameservers = [ "1.1.1.1" ];
    firewall.allowedTCPPorts = [ 80 443 6443 ];
  };

  system.stateVersion = "24.05";
}
