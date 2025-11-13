# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX-based CV/resume repository using the Awesome-CV template (https://github.com/posquit0/Awesome-CV). The repository maintains three document variants with different levels of detail and content sections.

## Building Documents

Use the Makefile to build documents:

```bash
make              # Build full CV (default)
make cv           # Build full CV (cv.pdf)
make cv_short     # Build short CV (cv_short.pdf)
make resume       # Build resume (resume.pdf)
make coverletter  # Build cover letter (coverletter.pdf)
make build-all    # Build all documents
make clean        # Remove build artifacts (keep PDFs)
make clean-all    # Remove all generated files including PDFs
```

Alternatively, compile directly using XeLaTeX:

```bash
xelatex cv.tex           # Full CV with research, patents, publications
xelatex cv_short.tex     # Short CV focused on education and skills
xelatex resume.tex       # Traditional resume format
xelatex coverletter.tex  # Cover letter template
```

LaTeX build artifacts (`.aux`, `.log`, `.synctex.gz`, `.fls`, `.fdb_latexmk`, `.out`) are gitignored and should not be committed.

## Architecture

### Document Structure

The repository uses a modular architecture where each main document (cv.tex, cv_short.tex, resume.tex) imports content sections from subdirectories:

- **cv.tex** → includes sections from `cv/` directory
  - Full curriculum vitae with comprehensive details
  - Includes: summary, experience, research, patents, pubs, honors, education
  - Optional sections (commented out): services, skills, courses, presentation, extracurricular, writing, committees

- **cv_short.tex** → includes sections from `cv_short/` directory
  - Condensed version emphasizing education and skills
  - Includes: summary, education, experience, skills, courses, honors
  - Optional sections (commented out): research, pubs

- **resume.tex** → includes sections from `resume/` directory
  - Traditional resume format (note: contains template author's placeholder data)
  - Includes: education, experience, extracurricular, honors, presentation, writing, committees

### Configuration

Each main `.tex` file contains:
- Document class configuration (paper size: letterpaper for cv.tex/cv_short.tex, a4paper for resume.tex)
- Page geometry settings (margins, footskip)
- Font directory specification (`fonts/` contains custom fonts)
- Color scheme (default: awesome-red, customizable to other Awesome-CV colors)
- Personal information in preamble (name, position, contact details)
- Section imports using `\input{}` commands

### Customization Points

When editing the CV:
- **Personal details**: Edit the preamble of the main .tex file (lines 54-69 in cv.tex)
- **Content sections**: Edit the corresponding .tex file in cv/, cv_short/, or resume/ directories
- **Layout/spacing**: Adjust `\vspace{}` commands between sections in the main file
- **Sections included**: Comment/uncomment `\input{}` lines in the main file
- **Color scheme**: Change `\colorlet{awesome}{awesome-red}` to other Awesome-CV colors
- **Paper size**: Modify `\documentclass` line (letterpaper vs a4paper)

### Section Files

Each section file (e.g., `cv/experience.tex`, `cv/pubs.tex`) contains LaTeX content for that specific CV section. These files use Awesome-CV custom environments and commands defined in `awesome-cv.cls`.

## Key Files

- `awesome-cv.cls` - Awesome-CV class file defining document structure and styling
- `fontawesome.sty` - FontAwesome icon package for social media icons
- `fonts/` - Custom font files used by the template
- `.gitignore` - Excludes LaTeX build artifacts and IDE files
