{ lib, config, ... }: 
{
  programs.git = {
    enable = true;

    userEmail = "ale.moreno991@gmail.com";
    userName = "Alejandro Moreno";

  };
}
