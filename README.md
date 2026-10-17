# Homebrew Tap — Dever Labs

This is the official [Homebrew](https://brew.sh) tap for [Dever Labs](https://github.com/dever-labs) apps.

## Usage

Install a cask directly (no separate tap step needed):

```bash
brew install dever-labs/tap/<cask>
```

Or add the tap first if you prefer:

```bash
brew tap dever-labs/tap
brew install --cask <cask>
```

## Available Casks

| Cask | Description |
|---|---|
| [`postly`](Casks/postly.rb) | API client for developers — with native Backstage, GitHub, and GitLab integration |
| [`mockly`](Casks/mockly.rb) | Mock server for HTTP, gRPC, Redis, Kafka, and 17 other protocols |

## About

Cask formulas in this tap are updated automatically whenever a new version is published:

- [`postly`](Casks/postly.rb) — by the [Postly release workflow](https://github.com/dever-labs/postly/blob/main/.github/workflows/release.yml)
- [`mockly`](Casks/mockly.rb) — by [goreleaser's `homebrew_casks`](https://github.com/dever-labs/mockly/blob/main/.goreleaser.yaml) as part of the [mockly release workflow](https://github.com/dever-labs/mockly/blob/main/.github/workflows/ci.yml)
