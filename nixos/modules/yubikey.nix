{ lib, pkgs, ... }:
{
  services = {
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
  };

  security.pam.u2f = {
    enable = true;
    interactive = true;
    cue = true;

    authFile = pkgs.writeText "u2f-mappings" (lib.concatStrings [
      "alejandro:Xh7FGqAF3pqymIfPNJEsQMAx5xo4wQ0u+fjZTlqMeRF1ysMJ0Jsg9vddSSHA4GYWtZkRKJAO9+E4BP4ydVChAw==,DpfysB0+91D4Q30txtf0qyIeHs2pihV0+FWyRMRaKVS8L+wsI1CrRuyO1advewHZQGqhVJvxIpb5xSqCscXbag==,es256,+presence"
    ]);
  };

  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
  };

}
