{
  description = "Development shell for a generic Rust project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs: {
    devShells = {
      x86_64-linux = {
        default = inputs.nixpkgs.legacyPackages.x86_64-linux.mkShell {
          buildInputs = [
            inputs.nixpkgs.legacyPackages.x86_64-linux.rustup
            inputs.nixpkgs.legacyPackages.x86_64-linux.nushell
          ];

          shellHook = ''nu'';
        };
      };
    };
  };
}
