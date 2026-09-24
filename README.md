# Homebrew Tap

Install command-line tools from this Homebrew tap.

## Contents

- [Formulae](#formulae)
- [Install Memoria](#install-memoria)
- [Upgrade Memoria](#upgrade-memoria)
- [Install uah](#install-uah)
- [Release model](#release-model)

## Formulae

| Formula | Description |
| --- | --- |
| [Memoria](Formula/memoria.rb) | Keeps project documentation connected to the code it explains. |
| [uah](Formula/uah.rb) | Terminal coding agent that works like Codex, built on unreal-agent. |

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

## Upgrade Memoria

The formula installs Memoria 0.3.0 on macOS Ventura or newer.
The [changelog](https://github.com/viktordanov/rs-memoria/blob/v0.3.0/CHANGELOG.md) describes the new commands and output improvements.
Version 0.3.0 retains the binary lock codec and whole-file freshness rules from 0.2.0.

If your project still uses `.memoria/state.json`, preserve the legacy state and configuration outside the worktree.
Then use the [0.2.0 cutover procedure](https://github.com/viktordanov/rs-memoria/blob/v0.2.0/docs/releases/0.2.0.md).
The binary upgrade does not upgrade installed agent skills or activate client hooks.

## Install uah

uah is a terminal coding agent that works like Codex. Its source is [uagent-harness](https://github.com/viktordanov/uagent-harness).

```sh
brew install viktordanov/tap/uah
codex login     # uah uses your ChatGPT login
uah doctor      # checks the setup
```

The formula installs the macOS or Linux binary for your CPU from the uagent-harness GitHub release, checks its SHA-256, and installs bash, zsh, and fish completions.

## Release model

The formula supports Apple Silicon and Intel Macs. It selects the correct native binary and verifies its SHA-256 checksum during installation.

The [Memoria source repository](https://github.com/viktordanov/rs-memoria) is public.
This public tap contains the Homebrew formula, versioned macOS binaries, checksums, and MIT license.

Next: invoke `memoria --version` after installation.
