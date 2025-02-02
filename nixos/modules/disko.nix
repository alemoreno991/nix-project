{
  disko.devices = {
    disk = {
      nvme0n1 = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              label = "boot";
              name = "ESP";
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                ];
              };
            };
            # luks-swap = {
            #   size = "64G";
            #   label = "luks";
            #   content = {
            #     type = "luks";
            #     name = "cryptswap";
            #     # extraOpenArgs = [
            #     #   "--allow-discards"
            #     #   "--perf-no_read_workqueue"
            #     #   "--perf-no_write_workqueue"
            #     # ];
            #     # # https://0pointer.net/blog/unlocking-luks2-volumes-with-tpm2-fido2-pkcs11-security-hardware-on-systemd-248.html
            #     # settings = {crypttabExtraOpts = ["fido2-device=auto" "token-timeout=10"];};
            #     content = {
            #       type = "swap";
            #       extraArgs = ["-L" "swap" "-f"];
            #       resumeDevice = true;
            #     };
            #   };
            # };
            luks-root = {
              size = "100%";
              label = "luks";
              content = {
                type = "luks";
                name = "cryptroot";
                settings = {
                  crypttabExtraOpts = ["fido2-device=auto" "token-timeout=10"];
                };
                content = {
                  type = "ext4";
                  extraArgs = ["-L" "nixos" "-f"];
                };
              };
            };
          };
        };
      };
    };
  };
}
