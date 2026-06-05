{...}: {
  flake.nixosModules.nvidia = {pkgs, ...}: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = builtins.attrValues {
        inherit
          (pkgs)
          libva-vdpau-driver
          libvdpau
          libvdpau-va-gl
          nvidia-vaapi-driver
          vdpauinfo
          libva
          libva-utils
          ;
      };
    };
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };
}
