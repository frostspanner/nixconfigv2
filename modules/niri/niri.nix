{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.niri = {pkgs, ...}: {
    imports = [
     self.nixosModules.mpv
     self.nixosModules.desktop
    ];

    nix.settings = {
      extra-substituters = ["https://noctalia.cachix.org"];
      extra-trusted-public-keys = ["noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="];
    };

    programs.niri.enable = true;
    programs.niri.useNautilus = true;

    environment.systemPackages = [
      pkgs.yt-dlp
          pkgs.xwayland-satellite
          pkgs.kitty
         inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
  };
}
