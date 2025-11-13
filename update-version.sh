#!/bin/bash
# Script to update CV version and date

set -e

# Get current date
YEAR=$(date +%Y)
MONTH=$(date +%m)
MONTH_NAME=$(date +%B)

# Generate version in format YYYY.MM
VERSION="${YEAR}.${MONTH}"
DATE_STRING="${MONTH_NAME} ${YEAR}"

# Update version.tex
cat > version.tex <<EOF
% Version and date information for CV documents
% This file is auto-generated. Use update-version.sh to update.

\newcommand{\cvversion}{${VERSION}}
\newcommand{\cvdate}{${DATE_STRING}}
EOF

echo "Updated version.tex:"
echo "  Version: ${VERSION}"
echo "  Date: ${DATE_STRING}"

# Update README.md
if [ -f README.md ]; then
    # macOS sed requires a backup extension, Linux doesn't
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/Updated: .*/Updated: ${DATE_STRING}/" README.md
    else
        sed -i "s/Updated: .*/Updated: ${DATE_STRING}/" README.md
    fi
    echo "Updated README.md"
fi
