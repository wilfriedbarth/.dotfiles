# dotfiles

> Modern development environment configuration for macOS

This repository contains my personal dotfiles and setup scripts for a productive development environment on macOS. It uses [Homebrew](https://brew.sh/) for package management and [GNU Stow](https://www.gnu.org/software/stow/) for symlink management.

## 🚀 Quick Start

```bash
# Clone this repository
git clone https://github.com/wilfriedbarth/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run the interactive installer
./install.sh
```

The installer will:
1. Install Homebrew and all dependencies
2. Symlink configuration files to `~/.config/`
3. Set up Fish as your default shell
4. Configure Volta for Node.js version management

## 📦 What's Included

### Development Tools
- **Shell**: Fish with custom functions and aliases
- **Editor**: Neovim with LazyVim configuration
- **Terminal**: WezTerm with custom configuration
- **Multiplexer**: Zellij for terminal session management
- **Prompt**: Starship for a beautiful, fast shell prompt
- **Version Managers**: Volta (Node.js), SDKMAN (Java)

### CLI Utilities
- **bat**: Better `cat` with syntax highlighting
- **lsd**: Better `ls` with icons and colors
- **fd**: Better `find` for file search
- **ripgrep**: Fast text search
- **dust**: Better `du` for disk usage
- **procs**: Better `ps` for process viewing
- **delta**: Better git diffs
- **zoxide**: Smart directory jumping
- **fzf**: Fuzzy finder for everything

### GUI Applications
- **Cursor**: AI-powered code editor
- **WezTerm**: GPU-accelerated terminal emulator
- **OrbStack**: Fast Docker Desktop alternative
- **JetBrains Toolbox**: IDE manager

## 📂 Structure

```
.dotfiles/
├── fish/          # Fish shell configuration
├── git/           # Git configuration
├── nvim/          # Neovim configuration (LazyVim)
├── starship/      # Starship prompt configuration
├── wezterm/       # WezTerm terminal configuration
├── zellij/        # Zellij multiplexer configuration
├── install.sh     # Interactive installer script
├── macos-install-deps.sh  # Install Homebrew packages
├── macos-setup-env.sh     # Symlink configurations
└── macos-clean-env.sh     # Remove symlinks
```

## 🔧 Manual Usage

### Install Dependencies Only
```bash
./macos-install-deps.sh
```

### Set Up Configuration Files
```bash
./macos-setup-env.sh
```

### Remove Configuration Symlinks
```bash
./macos-clean-env.sh
```

### Update All Packages
```bash
topgrade
```

## 🎨 Customization

Each configuration directory can be modified to suit your preferences:

- **Fish**: Edit `fish/.config/fish/config.fish` for shell configuration
- **Git**: Edit `git/.gitconfig` for git settings
- **Neovim**: Edit files in `nvim/.config/nvim/lua/` for editor customization
- **Starship**: Edit `starship/.config/starship.toml` for prompt customization
- **WezTerm**: Edit `wezterm/.config/wezterm/wezterm.lua` for terminal settings
- **Zellij**: Edit `zellij/.config/zellij/config.kdl` for multiplexer settings

After making changes, run `./macos-setup-env.sh` to update symlinks.

## 🔄 Keeping Up to Date

```bash
# Update all packages and tools
topgrade

# Update Homebrew packages only
brew update && brew upgrade

# Update dotfiles repository
cd ~/.dotfiles
git pull
./macos-setup-env.sh
```

## 🐟 Fish Shell Aliases & Functions

Common aliases configured in Fish:
- `vim` → `nvim`
- `cat` → `bat`
- `ls` → `lsd` (with git integration)
- `cd` → `z` (zoxide smart jumping)
- `find` → `fd`
- `ps` → `procs`
- `sed` → `sd`
- `du` → `dust`
- `make` → `mmake`
- `lzg` → `lazygit`
- `lzn` → `lazynpm`

Custom git functions in `fish/.config/fish/functions/`:
- `gwip` - Save work in progress
- `gunwip` - Restore from work in progress
- `gbda` - Delete merged branches
- `grename` - Rename current branch
- And many more!

## 📝 Notes

- Designed for **macOS** (Apple Silicon and Intel)
- Requires **macOS 11.0** or later
- Some tools may require additional setup (e.g., SDKMAN for Java)
- Configuration includes sensible defaults but is meant to be customized

## 🤝 Contributing

Feel free to fork and adapt these dotfiles for your own use. If you find a bug or have a suggestion, please open an issue.

## 📄 License

These dotfiles are provided as-is for personal use. Feel free to use, modify, and share!
