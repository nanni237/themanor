{ config, pkgs, ... }:
{
  
  networking.extraHosts = 
  ''
    192.168.0.3 dante.dalvarez.uk
    192.168.0.3 hc-k8s-api.dalvarez.uk
  '';

  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  services.kubernetes = {
    roles = ["master" "node"];
    masterAddress = "hc-k8s-api.dalvarez.uk";
    apiserverAddress = "https://hc-k8s-api.dalvarez.uk:6443";
    easyCerts = true;
    addons.dns.enable = true;
    kubelet.extraOpts = "--fail-swap-on=false";
    apiserver = {
      securePort = 6443;
      advertiseAddress = "192.168.0.3";
    };
  };
}