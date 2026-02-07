# Makefile for generating CV documents
# Uses XeLaTeX to compile LaTeX documents

.PHONY: all cv cv_short cv_staff coverletter clean clean-all update-version help

# Default target - build the full CV
all: cv

# Build full CV
cv:
	xelatex cv.tex

# Build short CV
cv_short:
	xelatex cv_short.tex

# Build staff-level CV
cv_staff:
	xelatex cv_staff.tex

# Build cover letter
coverletter:
	xelatex coverletter.tex

# Build all documents
build-all: cv cv_short cv_staff coverletter

# Clean LaTeX build artifacts (keep PDFs)
clean:
	rm -f *.aux *.log *.out *.fls *.fdb_latexmk *.synctex.gz

# Clean everything including PDFs
clean-all: clean
	rm -f *.pdf

# Update version and date
update-version:
	./update-version.sh

# Display help
help:
	@echo "Available targets:"
	@echo "  make          - Build full CV (cv.pdf)"
	@echo "  make cv       - Build full CV (cv.pdf)"
	@echo "  make cv_short - Build short CV (cv_short.pdf)"
	@echo "  make cv_staff - Build staff-level CV (cv_staff.pdf)"
	@echo "  make coverletter - Build cover letter (coverletter.pdf)"
	@echo "  make build-all - Build all documents"
	@echo "  make clean    - Remove build artifacts (keep PDFs)"
	@echo "  make clean-all - Remove all generated files including PDFs"
	@echo "  make update-version - Update version and date to current"
	@echo "  make help     - Show this help message"
