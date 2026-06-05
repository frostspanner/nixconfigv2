{...}: {
  flake.nixosModules.mpv = {pkgs, ...}: {
    environment.systemPackages = [
      (pkgs.mpv.override {
        scripts = [
          pkgs.mpvScripts.mpris
        ];
      })
    ];
  };
}
