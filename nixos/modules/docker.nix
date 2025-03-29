{pkgs, ...}: let
  user = "alejandro";
in {
  virtualisation.docker.enable = true;
  users.users.${user}.extraGroups = ["docker"];
  hardware.nvidia-container-toolkit.enable = true;
}
