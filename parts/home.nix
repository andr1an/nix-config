{inputs, ...}: {
  flake.homeConfigurations = {
    "andrian@tel-uvirith" = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        inherit inputs;
        outputs = inputs.self.outputs;
      };
      modules = [../home/andrian.nix];
    };
  };
}
