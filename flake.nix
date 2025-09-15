{
  description = "Nixos package for linux kernel module tcp-brutal congestion control algorithm";
  outputs =
    { ... }:
    {
      nixosModules.default =
        { config, ... }:
        {
          boot.extraModulePackages = [ (config.boot.kernelPackages.callPackage ./module.nix { }) ];
        };
    };
}
