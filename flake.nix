{
  description = "Development shell for a generic Rust project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs: {
    devShells = {
      x86_64-linux = {
        default =
          let
            pkgs = import inputs.nixpkgs {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          in
          pkgs.mkShell {
            buildInputs = [
              pkgs.rustup
            ];
          };
      };
    };
  };
}
