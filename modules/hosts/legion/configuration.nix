{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.legion-niri = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.legion
      self.nixosModules.nix
      self.nixosModules.niri
      self.nixosModules.global
      self.nixosModules.nvidia
    ];
  };

  flake.nixosConfigurations.legion-gnome = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.legion
      self.nixosModules.nix
      # TODO
      # self.nixosModules.gnome
    ];
  };

  flake.nixosConfigurations.legion-kde = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.legion
      self.nixosModules.nix
      # TODO
      # self.nixosModules.kde
    ];
  };

  flake.nixosModules.legion = {...}: {
    imports = [
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "legion";
    networking.networkmanager.enable = true;

    environment.sessionVariables = {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";

      # Not officially in the specification
      XDG_BIN_HOME = "$HOME/.local/bin";
      NIXOS_OZONE_WL = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    time.timeZone = "America/New_York";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    services = {
      xserver.xkb = {
        layout = "us";
        variant = "dvorak";
      };
    };

    services.printing.enable = true;
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    security.rtkit.enable = true;

    users.users.tpb = {
      isNormalUser = true;
      description = "Timothy Paul";
      initialPassword = "$6$kkAPft8jEyfkn/Yv$/ZVGIH6k2k10HDhndLzDz21Ohn5LdtOKuUkxB3do9hcDdHxVD3MqJwnbYRycyfcyWvNy8QKYasLP67.v7w654.";
      extraGroups = ["networkmanager" "wheel"];
      packages = [
      ];
    };

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.05";
  };
}
