# Personal dotfiles

This repository stores personal current command-line/shell settings

## Instructions

To avoid publishing sensitive content under `.zshrc` and `.zprofile` files and also leak sensitive Git settings, this repository leverages `gitleaks` as a `husky` pre-commit action.

## Installation instructions

> Assuming system-level dependencies like  `brew`, `mise` and `pnpm` are already installed.

```
mise use node@22
pnpm install
```

## Usage

Sync current environment settings:

```
sh update.sh
```
