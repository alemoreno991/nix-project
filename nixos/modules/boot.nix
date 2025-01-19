{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  boot.initrd.luks.devices."luks-f3898c3b-e49d-4ebe-bfaf-bb87e0b5dd93".device = "/dev/disk/by-uuid/f3898c3b-e49d-4ebe-bfaf-bb87e0b5dd93";

}
