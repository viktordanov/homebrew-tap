# Homebrew Tap

Install command-line tools from this Homebrew tap.

## Contents

- [Formulae](#formulae)
- [Install Memoria](#install-memoria)
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

## Release model

The formula supports Apple Silicon and Intel Macs. It selects the correct native binary and verifies its SHA-256 checksum during installation.

Memoria's source repository is private. This public tap contains the Homebrew formula, versioned macOS binaries, checksums, and MIT license.
