# Homebrew tap for sandcastle

[sandcastle](https://github.com/cburkhal/sandcastle) runs one OpenCode instance per Git repo, each in its own Apple `container` VM on macOS.

```
brew install cburkhal/tap/sandcastle
```

This installs the command-line tool, built from source, and the Bitwarden CLI. Apple `container` is a separate installer: https://github.com/apple/container/releases

The app (`brew install --cask`) follows once signed releases exist.
