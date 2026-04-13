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

## About

Cask formulas in this tap are updated automatically by the [Postly release workflow](https://github.com/dever-labs/postly/blob/main/.github/workflows/release.yml) whenever a new version is published.
