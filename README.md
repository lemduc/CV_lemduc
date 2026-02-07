# CV of Duc Minh Le

[![Build CV](https://github.com/lemduc/CV_lemduc/workflows/Build%20CV/badge.svg)](https://github.com/lemduc/CV_lemduc/actions)

My most up-to-date CV, based on the [Awesome-CV](https://github.com/posquit0/Awesome-CV) template.

## Requirements

This project requires XeLaTeX to be installed and available in your PATH.

### Installing LaTeX

**macOS:**
```bash
# Option 1: Smaller install without GUI tools (recommended)
brew install --cask mactex-no-gui

# Option 2: Full MacTeX with GUI tools
brew install --cask mactex

# If MacTeX is already installed but not in PATH, add it:
export PATH="/Library/TeX/texbin:$PATH"
```

**Linux:**
```bash
# Ubuntu/Debian
sudo apt-get install texlive-xetex texlive-fonts-extra

# Fedora
sudo dnf install texlive-xetex texlive-fontawesome
```

## Building Documents

Use the Makefile to build your CV:

```bash
make              # Build full CV (default)
make cv           # Build full CV (cv.pdf)
make cv_short     # Build short CV (cv_short.pdf)
make cv_staff     # Build staff-level CV (cv_staff.pdf)
make coverletter  # Build cover letter (coverletter.pdf)
make build-all    # Build all documents
make clean        # Remove build artifacts (keep PDFs)
make clean-all    # Remove all generated files including PDFs
make update-version # Update version and date to current
make help         # Show available commands
```

### Updating Version

The repository uses centralized version management. To update the date across all documents:

```bash
make update-version
# or
./update-version.sh
```

This updates `version.tex` and `README.md` with the current date.

Alternatively, compile directly using XeLaTeX:
```bash
xelatex cv.tex
```

## Document Variants

- **cv.tex** - Full curriculum vitae with comprehensive details including research, patents, and publications
- **cv_short.tex** - Condensed version emphasizing education and skills
- **cv_staff.tex** - Staff-level CV focusing on leadership impact and technical expertise
- **coverletter.tex** - Cover letter template

## Structure

The repository uses a modular architecture:
- `cv/` - Content sections for the full CV
- `cv_short/` - Content sections for the short CV
- `cv_staff/` - Content sections for the staff-level CV
- `awesome-cv.cls` - LaTeX class file for styling
- `fonts/` - Custom fonts used by the template

To modify content, edit the corresponding `.tex` files in each directory.

## Development Workflow

### Pre-commit Hooks (Optional)

The repository includes pre-commit hooks to maintain code quality and prevent common mistakes:

```bash
# Setup (requires Python)
pip install pre-commit  # or: brew install pre-commit
./setup-hooks.sh

# Or manually:
pre-commit install
```

The hooks will automatically:
- Clean LaTeX build artifacts before commits
- Check for trailing whitespace and line endings
- Prevent committing large files
- Lint LaTeX files with chktex
- Ensure consistent formatting

To bypass hooks when needed: `git commit --no-verify`

### GitHub Actions

The repository includes automated CI/CD that:
- Lints all LaTeX files on every push
- Automatically builds all CV variants
- Uploads PDFs as downloadable artifacts
- Can be manually triggered from the Actions tab

### Creating Releases

To create a versioned release with PDF attachments:

```bash
# Update version first
make update-version

# Commit changes
git add .
git commit -m "Update CV for [date/purpose]"

# Create and push a version tag
git tag v2025.11
git push origin master --tags
```

The GitHub Actions workflow will automatically:
1. Build all CV documents
2. Create a GitHub release
3. Attach PDFs and checksums to the release
4. Make PDFs downloadable from the Releases page

Since PDFs are now gitignored, use GitHub Releases or Actions artifacts to download built PDFs.

## License

Template: [Awesome-CV](https://github.com/posquit0/Awesome-CV) by Claud D. Park, licensed under CC BY-SA 4.0

Updated: November 2025
