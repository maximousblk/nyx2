{ modx, ... }: {
  imports = [ modx.nixos.tailscale-services ];

  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";

  virtualisation.oci-containers.containers.crafty = {
    serviceName = "crafty";
    image = "registry.gitlab.com/crafty-controller/crafty-4:latest";
    pull = "always";
    ports = [
      "8443:8443"
      "25565:25565"
      "19132:19132/udp"
    ];
    volumes = [ "crafty:/crafty" ];
  };

  optx.tailscale.services.crafty = {
    serve."https:443" = "https+insecure://localhost:8443";
    backends = [ "crafty.service" ];
  };
}
