{...}: {
  flake.nixosModules.global = {pkgs, ...}: {
    # run0 gang
    security = {
      sudo.enable = false;
      polkit.enable = true;
    };
    console = {
      keyMap = "dvorak";
    };

    networking.networkmanager.enable = true;

    services = {
      thermald.enable = true;
      power-profiles-daemon.enable = true;
    };

    environment.systemPackages = builtins.attrValues {
      inherit
        (pkgs)
        fd
        fzf
        nushell
        ripgrep
        neovim
        ffmpeg-full
        helix
        git
        wget
        curl
        nixd
        zip
        unzip
        ;
    };

    programs = {
      starship.enable = true;
      bat.enable = true;
      yazi.enable = true;
      direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };
    };
  };
}
