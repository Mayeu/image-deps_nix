# Image test

Fixed by deps-nix at commit `d4cfd6049ef800f6fd482f6f422c05fef54133b4`.

Trying build a project with [Image](https://github.com/elixir-image/image) as dependency.

```
$ make build
```

Outside of `nix build`:

```
==> vix
Downloading precompiled NIF to /Users/m/Library/Caches/elixir_make/vix-nif-2.17-aarch64-apple-darwin-0.33.0.tar.gz
Compiling 28 files (.ex)
Generated vix app
```

With `nix build`:

```
error: builder for '/nix/store/fh8cvf4yvf0mmq8vvbb4gzsq2lrqllvg-vix-0.33.0.drv' failed with exit code 1;
       last 22 log lines:
       > bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
       > Running phase: unpackPhase
       > unpacking source archive /nix/store/q292xlm3wgmdagq7p7zps21k91a8dy1d-vix-0.33.0
       > source root is vix-0.33.0
       > Running phase: patchPhase
       > Running phase: updateAutotoolsGnuConfigScriptsPhase
       > Running phase: configurePhase
       > bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
       > Running phase: buildPhase
       > /nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
       > /nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
       > /nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
       > /nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
       > ** (File.Error) could not make directory (with -p) "/homeless-shelter/Library/Caches/elixir_make": no such file or directory
       >     (elixir 1.18.2) lib/file.ex:346: File.mkdir_p!/1
       >     (elixir_make 0.9.0) lib/elixir_make/artefact.ex:22: ElixirMake.Artefact.cache_dir/0
       >     (elixir_make 0.9.0) lib/elixir_make/artefact.ex:85: ElixirMake.Artefact.archive_path/3
       >     (elixir_make 0.9.0) lib/mix/tasks/compile.elixir_make.ex:226: Mix.Tasks.Compile.ElixirMake.download_or_reuse_nif/3
       >     (elixir_make 0.9.0) lib/mix/tasks/compile.elixir_make.ex:169: Mix.Tasks.Compile.ElixirMake.run/1
       >     (mix 1.18.2) lib/mix/task.ex:495: anonymous fn/3 in Mix.Task.run_task/5
       >     (mix 1.18.2) lib/mix/tasks/compile.all.ex:117: Mix.Tasks.Compile.All.run_compiler/2
       >     (mix 1.18.2) lib/mix/tasks/compile.all.ex:97: Mix.Tasks.Compile.All.compile/4
       For full logs, run 'nix log /nix/store/fh8cvf4yvf0mmq8vvbb4gzsq2lrqllvg-vix-0.33.0.drv'.
error: 1 dependencies of derivation '/nix/store/d9zcax74ja47siy102xjg2ni3p9bw7h4-image-0.56.0.drv' failed to build
error: 2 dependencies of derivation '/nix/store/1hma6imnf7a0ccw1an7gavc6nsj11bc2-photo-8c58bc0ca69d3e6b7d933bff2d945b6031ad20ad.drv' failed to build
make: *** [Makefile:20: build] Error 1
```
