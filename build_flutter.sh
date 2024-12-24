#!/bin/bash

# Exit on errors
set -e

# Install Flutter
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Verify Flutter installation
flutter doctor -v

# Enable Flutter Web
flutter config --enable-web

# Build the project for web
flutter build web

echo "Flutter web build completed."
