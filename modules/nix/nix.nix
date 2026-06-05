{...}: {
  flake.nixosModules.nix = {pkgs, ...}: {
    imports = [
    ];

    programs.direnv = {
      enable = true;
      silent = false;
      loadInNixShell = true;
      direnvrcExtra = "";
      nix-direnv = {
        enable = true;
      };
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];
    #programs.nix-ld.enable = true;
    nixpkgs.config.allowUnfree = true;

    nix.settings = {
      auto-optimise-store = true;
    };

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    environment.systemPackages = with pkgs; [
      # Nix tooling
      nixd
      # statix
      alejandra
      # manix
      # nix-inspect
    ];
  };
}
