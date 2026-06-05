{self, ...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = [
      self.nixosModules.gaming
    ];
    programs = {
      firefox.enable = true;
    };
    environment.systemPackages = builtins.attrValues {
      inherit
        (pkgs)
        imagemagick
        ;
    };
    fonts.packages = builtins.attrValues {
      inherit
        (pkgs)
        adwaita-fonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        ibm-plex
        departure-mono
        monaspace
        atkinson-hyperlegible-next
        atkinson-hyperlegible-mono
        corefonts
        ;
      inherit (pkgs.nerd-fonts) symbols-only;
      inherit (pkgs.maple-mono) variable;
    };
  };
}
