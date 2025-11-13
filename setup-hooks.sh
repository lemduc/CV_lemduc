#!/bin/bash
# Script to setup pre-commit hooks for CV repository

set -e

echo "Setting up pre-commit hooks for CV repository..."

# Check if pre-commit is installed
if ! command -v pre-commit &> /dev/null; then
    echo "pre-commit is not installed."
    echo ""
    echo "To install pre-commit:"
    echo "  macOS:   brew install pre-commit"
    echo "  Linux:   pip install pre-commit"
    echo "  Python:  pip install pre-commit"
    echo ""
    read -p "Would you like to install it via pip now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        pip install pre-commit
    else
        echo "Skipping pre-commit installation. Please install it manually."
        exit 1
    fi
fi

# Install the pre-commit hooks
echo "Installing pre-commit hooks..."
pre-commit install

# Optionally run on all files
read -p "Would you like to run pre-commit on all files now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    pre-commit run --all-files || true
fi

echo ""
echo "✓ Pre-commit hooks installed successfully!"
echo ""
echo "The hooks will now run automatically before each commit."
echo "To run manually: pre-commit run --all-files"
echo "To bypass hooks: git commit --no-verify"
