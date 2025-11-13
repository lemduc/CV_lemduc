# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX-based CV repository using the Awesome-CV template (https://github.com/posquit0/Awesome-CV). The repository maintains three document variants with different levels of detail and content sections.

## Building Documents

Use the Makefile to build documents:

```bash
make              # Build full CV (default)
make cv           # Build full CV (cv.pdf)
make cv_short     # Build short CV (cv_short.pdf)
make coverletter  # Build cover letter (coverletter.pdf)
make build-all    # Build all documents
make clean        # Remove build artifacts (keep PDFs)
make clean-all    # Remove all generated files including PDFs
make update-version # Update version and date to current
```

## Version Management

The repository uses centralized version/date management through `version.tex`:

- **version.tex** - Contains `\cvversion` and `\cvdate` commands used across all documents
- **update-version.sh** - Script to update version and date to current month/year
- To update: Run `make update-version` or `./update-version.sh`

This ensures consistent dates across all CV documents and the README.

Alternatively, compile directly using XeLaTeX:

```bash
xelatex cv.tex           # Full CV with research, patents, publications
xelatex cv_short.tex     # Short CV focused on education and skills
xelatex coverletter.tex  # Cover letter template
```

LaTeX build artifacts (`.aux`, `.log`, `.synctex.gz`, `.fls`, `.fdb_latexmk`, `.out`) are gitignored and should not be committed.

## Architecture

### Document Structure

The repository uses a modular architecture where each main document (cv.tex, cv_short.tex) imports content sections from subdirectories:

- **cv.tex** → includes sections from `cv/` directory
  - Full curriculum vitae with comprehensive details
  - Includes: summary, experience, research, patents, pubs, honors, education
  - Optional sections (commented out): services, skills, courses, presentation, extracurricular, writing, committees

- **cv_short.tex** → includes sections from `cv_short/` directory
  - Condensed version emphasizing education and skills
  - Includes: summary, education, experience, skills, courses, honors
  - Optional sections (commented out): research, pubs

- **coverletter.tex** → customizable cover letter template
  - Personal information matches CV
  - Placeholder sections for customization per job application

### Configuration

Each main `.tex` file contains:
- Document class configuration (paper size: letterpaper for all documents)
- Page geometry settings (margins, footskip)
- Font directory specification (`fonts/` contains custom fonts)
- Color scheme (default: awesome-red, customizable to other Awesome-CV colors)
- Personal information in preamble (name, position, contact details)
- Section imports using `\input{}` commands (cv.tex and cv_short.tex)

### Customization Points

When editing the CV:
- **Personal details**: Edit the preamble of the main .tex file (lines 54-69 in cv.tex)
- **Content sections**: Edit the corresponding .tex file in cv/ or cv_short/ directories
- **Layout/spacing**: Adjust `\vspace{}` commands between sections in the main file
- **Sections included**: Comment/uncomment `\input{}` lines in the main file
- **Color scheme**: Change `\colorlet{awesome}{awesome-red}` to other Awesome-CV colors
- **Paper size**: Modify `\documentclass` line (letterpaper vs a4paper)

### Section Files

Each section file (e.g., `cv/experience.tex`, `cv/pubs.tex`) contains LaTeX content for that specific CV section. These files use Awesome-CV custom environments and commands defined in `awesome-cv.cls`.

## Quality Assurance

### LaTeX Linting

The repository includes automated LaTeX linting with `chktex`:
- **GitHub Actions**: Automatically lints `.tex` files on every push
- **Local usage**: Run `chktex -q -n 1 -n 2 -n 3 -n 8 -n 13 -n 25 -n 36 cv.tex`
- Disabled warnings: 1, 2, 3, 8, 13, 25, 36 (common false positives in CV templates)

### Pre-commit Hooks

Pre-commit hooks prevent common mistakes:
- **Setup**: Run `./setup-hooks.sh` or `pre-commit install`
- **Hooks included**:
  - Automatically runs `make clean` before commits
  - Checks for trailing whitespace and line endings
  - Prevents committing large files (>5MB)
  - Lints LaTeX files with chktex (warnings only)
  - Blocks LaTeX build artifacts from being committed
- **Bypass**: Use `git commit --no-verify` if needed
- **Manual run**: `pre-commit run --all-files`

### GitHub Actions

The CI/CD workflow (`.github/workflows/build-cv.yml`):
- Triggers on push to master and pull requests
- Lints all LaTeX files with chktex
- Builds all CV variants (cv, cv_short, coverletter)
- Uploads PDFs as artifacts (90-day retention)
- Can be manually triggered via workflow_dispatch

### Release Automation

The release workflow (`.github/workflows/release.yml`):
- Triggers when a version tag is pushed (e.g., `v2025.11`)
- Builds all CV documents
- Creates SHA256 checksums for verification
- Automatically creates a GitHub release
- Attaches PDFs and checksums to the release

To create a release:
```bash
git tag v2025.11
git push origin master --tags
```

**Note**: PDFs are now gitignored. To access built PDFs:
- Download from GitHub Releases (for tagged versions)
- Download from GitHub Actions artifacts (for any commit)

## Key Files

- `awesome-cv.cls` - Awesome-CV class file defining document structure and styling
- `fontawesome.sty` - FontAwesome icon package for social media icons
- `fonts/` - Custom font files used by the template
- `version.tex` - Centralized version and date information
- `Makefile` - Build automation and common tasks
- `update-version.sh` - Script to update version/date
- `setup-hooks.sh` - Script to setup pre-commit hooks
- `.pre-commit-config.yaml` - Pre-commit hooks configuration
- `.gitignore` - Excludes LaTeX build artifacts, IDE files, and PDFs
- `.editorconfig` - Editor configuration for consistent formatting
- `.github/workflows/build-cv.yml` - GitHub Actions CI/CD workflow
- `.github/workflows/release.yml` - GitHub Actions release automation workflow
