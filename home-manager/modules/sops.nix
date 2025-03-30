# https://github.com/getsops/sops
#
# Simple and flexible tool for managing secrets
{inputs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    # This is the file where the users' key is stored
    # NOTE: it needs to have been copied to this location on the host
    age.keyFile = "/home/alejandro/.config/sops/age/keys.txt";

    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/alejandro" = {
        path = "/home/alejandro/.ssh/id_ed25519";
      };
    };
  };
}
