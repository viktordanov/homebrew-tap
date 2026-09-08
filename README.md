# Homebrew Tap

Install command-line tools from this Homebrew tap.

## Contents

- [Formulae](#formulae)
- [Install Memoria](#install-memoria)
- [Upgrade to 0.2.0](#upgrade-to-020)
- [Release model](#release-model)

## Formulae

| Formula | Description |
| --- | --- |
| [Memoria](Formula/memoria.rb) | Keeps project documentation connected to the code it explains. |

## Install Memoria

Memoria keeps project documentation connected to the code it explains. It turns code changes into a focused documentation review queue for people and coding agents.

Install Memoria:

```sh
brew install viktordanov/tap/memoria
```

Upgrade to the newest published version:

```sh
brew update
brew upgrade memoria
```

Remove Memoria:

```sh
brew uninstall memoria
```

## Upgrade to 0.2.0

The formula installs Memoria 0.2.0 on macOS Ventura or newer.
This release replaces `.memoria/state.json` with `memoria.lock` beside `memoria.toml`.
It requires version 2 configuration and does not migrate legacy state automatically.

Before you change project state, preserve the legacy state and configuration outside the worktree.
Then follow the [0.2.0 cutover procedure](https://github.com/viktordanov/rs-memoria/blob/v0.2.0/docs/releases/0.2.0.md).
The binary upgrade does not upgrade installed agent skills or activate client hooks.

## Release model

The formula supports Apple Silicon and Intel Macs. It selects the correct native binary and verifies its SHA-256 checksum during installation.

The [Memoria source repository](https://github.com/viktordanov/rs-memoria) is public.
This public tap contains the Homebrew formula, versioned macOS binaries, checksums, and MIT license.

Next: invoke `memoria --version` after installation.
