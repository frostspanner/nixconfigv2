{...}:{
  flake.nixosModules.gaming = {pkgs, ...}: {
    programs.gamemode = {
    enable = true;
    settings = {
      general = {
        softrealtime = "on";
        inhibit_screensaver = 1;
      };
    };
  };
  programs.steam.enable = true;
    environment.systemPackages = [
    pkgs.gamescope
  ];

  };
}
