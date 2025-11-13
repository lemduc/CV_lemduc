# CV of Duc Minh Le

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
make resume       # Build resume (resume.pdf)
make coverletter  # Build cover letter (coverletter.pdf)
make build-all    # Build all documents
make clean        # Remove build artifacts (keep PDFs)
make clean-all    # Remove all generated files including PDFs
make help         # Show available commands
```

Alternatively, compile directly using XeLaTeX:
```bash
xelatex cv.tex
```

## Document Variants

- **cv.tex** - Full curriculum vitae with comprehensive details including research, patents, and publications
- **cv_short.tex** - Condensed version emphasizing education and skills
- **resume.tex** - Traditional resume format
- **coverletter.tex** - Cover letter template

## Structure

The repository uses a modular architecture:
- `cv/` - Content sections for the full CV
- `cv_short/` - Content sections for the short CV
- `resume/` - Content sections for the resume
- `awesome-cv.cls` - LaTeX class file for styling
- `fonts/` - Custom fonts used by the template

To modify content, edit the corresponding `.tex` files in each directory.

## License

Template: [Awesome-CV](https://github.com/posquit0/Awesome-CV) by Claud D. Park, licensed under CC BY-SA 4.0

Updated: November 2025
