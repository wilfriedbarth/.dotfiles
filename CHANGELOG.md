# Changelog

All notable changes to this dotfiles repository will be documented in this file.

## [Dotfile cleanup] - 2025-11-28

### Added
- **install.sh**: Interactive installer script that orchestrates the full setup process
- **CONTRIBUTING.md**: Guidelines for contributing to the dotfiles repository
- **CHANGELOG.md**: This file to track changes over time
- **.editorconfig**: Consistent coding style configuration across editors
- Enhanced shell scripts with:
  - Colored output (info, success, warning, error)
  - Better error handling (`set -euo pipefail`)
  - Improved user feedback and logging
  - Path validation and existence checks
  - Automatic Fish shell setup

### Changed
- **README.md**: Comprehensive rewrite with:
  - Detailed installation instructions
  - Complete tool listing and descriptions
  - Structure documentation
  - Usage examples and customization guide
- **macos-install-deps.sh**: 
  - Changed shebang from `#!/bin/sh` to `#!/usr/bin/env bash`
  - Added colored logging functions
  - Improved output formatting
  - Better error handling
  - Organized packages into sections
- **macos-setup-env.sh**:
  - Changed shebang from `#!/bin/sh` to `#!/usr/bin/env bash`
  - Added colored logging functions
  - Added Fish shell configuration
  - Better error handling and validation
  - Improved user feedback
- **macos-clean-env.sh**:
  - Changed shebang from `#!/bin/sh` to `#!/usr/bin/env bash`
  - Added colored logging functions
  - Better error handling
  - Improved user feedback
- **fish/.config/fish/config.fish**:
  - Replaced hardcoded paths with conditional checks
  - Better organization with comments
  - More robust path handling

### Improved
- **.gitignore**: Added entries for runtime files (fish_variables, lazy-lock.json)
- Code quality: All shell scripts now pass `shellcheck` validation
- Consistency: Unified logging and error handling across all scripts
- Documentation: More comprehensive and user-friendly

### Removed
- Backup files (*.pysave, *.bak) from git tracking

## Previous Changes

Previous changes were not tracked in a changelog. This is the first versioned release.

---

### Format Notes

This changelog follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format.

**Change Types:**
- `Added` for new features
- `Changed` for changes in existing functionality
- `Deprecated` for soon-to-be removed features
- `Removed` for now removed features
- `Fixed` for any bug fixes
- `Security` for vulnerability fixes

