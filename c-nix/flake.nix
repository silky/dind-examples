{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url     = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        img =
          pkgs.dockerTools.buildLayeredImage
          {
            name = "c-nix";
            tag  = "latest";
            contents = [
              # This is just to look around the image
              pkgs.coreutils

              # These are required
              pkgs.docker-client
              ../src
            ];
            config = {
              Cmd = ["${pkgs.python3}/bin/python" "main.py"];
            };
          };
      in
      {
        packages = {
          default = img;
        };
      }
    );
}
