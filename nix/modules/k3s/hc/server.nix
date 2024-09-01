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
    k3s
  ];

  services.k3s = {
    enable = true;
    role = "server";
  };

  virtualisation.containerd = {
    enable = true;
    settings =
      let
        fullCNIPlugins = pkgs.buildEnv {
          name = "full-cni";
          paths = with pkgs;[
            cni-plugins
            cni-plugin-flannel
          ];
        };
      in {
        plugins."io.containerd.grpc.v1.cri".cni = {
          bin_dir = "${fullCNIPlugins}/bin";
          conf_dir = "/var/lib/rancher/k3s/agent/etc/cni/net.d/";
        };
        # Optionally set private registry credentials here instead of using /etc/rancher/k3s/registries.yaml
        # plugins."io.containerd.grpc.v1.cri".registry.configs."registry.example.com".auth = {
        #  username = "";
        #  password = "";
        # };
      };
  };
  # TODO describe how to enable zfs snapshotter in containerd
  services.k3s.extraFlags = toString [
    "--container-runtime-endpoint unix:///run/containerd/containerd.sock"
  ];

  virtualisation.docker.storageDriver = "zfs";
}