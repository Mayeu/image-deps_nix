{
  description = "Photo";

  # The input of the flake
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  # The output of the flake
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        lib = pkgs.lib;

        pkgs = import nixpkgs {
          inherit system;
          #  config.allowUnfree = true;
        };

        version = self.rev or self.dirtyRev;

        elixir = let
          #inherit (lib) optional optionals;
          pname = "photo";
          src = ./.;

          mixNixDeps = pkgs.callPackages ./deps.nix {};
        in
          pkgs.beamPackages.mixRelease {
            inherit src pname version mixNixDeps;
            VIX_COMPILATION_MODE = "PLATFORM_PROVIDED_LIBVIPS";
          };

        shell = lib.callPackageWith pkgs ./shell.nix {inherit lib version;};
      in {
        devShells.default = shell;

        packages = {
          default = elixir;
        };
      }
    );
}
