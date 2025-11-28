# Contributing to dotfiles

Thank you for your interest in improving these dotfiles!

## 🐛 Reporting Issues

If you find a bug or have a suggestion:
1. Check if the issue already exists
2. Open a new issue with a clear description
3. Include your macOS version and relevant details

## 🔧 Making Changes

1. Fork the repository
2. Create a new branch for your changes
3. Test your changes thoroughly
4. Ensure shell scripts pass `shellcheck`
5. Submit a pull request

## 📝 Code Style

### Shell Scripts
- Use `#!/usr/bin/env bash` shebang
- Include `set -euo pipefail` for error handling
- Add comments for complex logic
- Use the logging functions for consistent output
- Test with `shellcheck` before committing

### Fish Configuration
- Keep functions in separate files under `functions/`
- Use descriptive function names
- Add comments for complex logic
- Test functions before committing

### Documentation
- Update README.md when adding new features
- Include usage examples
- Keep formatting consistent

## ✅ Testing

Before submitting:
```bash
# Test shell scripts
shellcheck *.sh

# Test installation (in a VM or test environment)
./install.sh

# Test individual scripts
./macos-install-deps.sh --help
./macos-setup-env.sh
./macos-clean-env.sh
```

## 🎯 Commit Messages

Use clear, descriptive commit messages using conventional commit formatting:
- `feat: add new tool installation`
- `fix: resolve symlink issue in setup script`
- `docs: update README with new features`
- `refactor: improve error handling in scripts`

## 📦 Adding New Tools

When adding new tools to `macos-install-deps.sh`:
1. Verify the tool is available in Homebrew
2. Add to the appropriate section (CLI tools or GUI apps)
3. Keep the list alphabetically sorted
4. Update README.md with tool description
5. Add any necessary configuration files

## 🙏 Thank You

Your contributions help make these dotfiles better for everyone!

