{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) optional optionals;
in
  pkgs.mkShell {
    # shellHook = ''
    # '';

    packages = with pkgs;
      [
        # GNU Basic stuff
        bash
        coreutils
        findutils
        gnumake

        # Nix
        nixd # Language Server
        nil # Language Server
        alejandra # Formatter

        # Elixir
        elixir_1_18
        elixir-ls

        treefmt
      ]
      ++ optional stdenv.isLinux libnotify # For ExUnit Notifier on Linux.
      ++ optional stdenv.isLinux inotify-tools # For file_system on Linux.
      ++ optional stdenv.isDarwin terminal-notifier # For ExUnit Notifier on macOS.
      ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
        # For file_system on macOS.
        CoreFoundation
        CoreServices
      ]);
  }
