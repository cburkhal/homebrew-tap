# Homebrew tap for sandcastle

[sandcastle](https://github.com/cburkhal/sandcastle) runs one OpenCode instance per Git repo, each in its own Apple `container` VM on macOS.

```
brew install --cask cburkhal/tap/sandcastle
```

This installs the app, signed and notarized, with the `sandcastle` command inside it, and the Bitwarden CLI.

For the command-line tool alone, built from source:

```
brew install cburkhal/tap/sandcastle
```

Install one or the other: both provide the `sandcastle` command. Apple `container` is a separate installer: https://github.com/apple/container/releases
