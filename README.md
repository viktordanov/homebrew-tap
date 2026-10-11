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

The formula installs Memoria 0.9.0 on macOS Ventura or newer.
The [migration notes](https://github.com/viktordanov/rs-memoria/blob/v0.9.0/CHANGELOG.md#migration-to-090) list every upgrade step.

Update every Memoria executable, including setup-action `version:` pins, before a project adds `section_guidance_files`.
Memoria 0.8 refuses that key. The token, `memoria.lock`, and configuration `version = 3` do not change.

1. Upgrade the executable with `brew upgrade memoria`, and update agent and CI executables to 0.9.0.
2. Capture in-flight review artifacts again. Manifest 2, packet 4, and view 2 artifacts are refused with regeneration text.
3. Upgrade each installed local agent skill with `memoria agent upgrade` and its target.
4. If a section names a file whose name starts with `!`, replace that token with a pattern that matches it, for example `?keep.rs`.

For versions before 0.8.0, follow the [earlier migration notes](https://github.com/viktordanov/rs-memoria/blob/v0.9.0/CHANGELOG.md#migration-to-080).
Keep your committed review history. The binary upgrade does not activate client hooks.

Known limits: the evidence budget can silently omit hunks, including with `--details` (OBS001).
A preview test remains sensitive to Git background maintenance; CI disables automatic maintenance (OBS002).
The macOS archives are cross-compiled on Linux. Native macOS runtime smoke and Homebrew installation were not run for this release.

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
