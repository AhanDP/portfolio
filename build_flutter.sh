#!/bin/bash

# Check if Flutter is already installed
if ! command -v flutter &> /dev/null
then
    echo "Flutter not found, installing Flutter..."

    # Install Flutter
    git clone https://github.com/flutter/flutter.git -b stable
    export PATH="$PATH:`pwd`/flutter/bin"
else
    echo "Flutter is already installed, skipping installation."
fi

# Verify Flutter installation
flutter --version

# Enable Flutter web
flutter config --enable-web

# Install dependencies
flutter pub get

# Build the web app
flutter build web
