{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # System packages
    bash-completion
  ];
}
