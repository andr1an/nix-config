{inputs, ...}: {
  flake.nixosConfigurations = {
    tel-uvirith = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        unstable = import inputs.nixpkgs-unstable {
          system = "x86_64-linux";
        };
      };
      modules = [
        ../hosts/tel-uvirith
        inputs.home-manager.nixosModules.home-manager
      ];
    };
  };
}
