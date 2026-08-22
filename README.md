![fish-flake logo](./assets/logo.png)

# fish-flake

A fish plugin for `nix flake` workflows with optional `direnv` support.

### Installation

Install with [fisher](https://github.com/jorgebucaran/fisher):

```shell
fisher install givensuman/fish-flake
```

### Usage

`flake init`

Initializes a workspace in the current directory

```bash
flake init github:nixos/templates#python
flake init # defaults to github:nixos/templates#utils-generic
```

`flake clean`

Cleans `direnv` cache and runs `nix-collect-garbage`

`flake list`

Lists packages used in current workspace

`flake status`

Status information for the current workspace

`flake update`

Updates the Nix lockfile and reloads the workspace

### Requirements

Requires `nix` with with `experimental-features = nix-command flakes` set. `direnv` is optional but recommended!

### License

[MIT](./LICENSE)
