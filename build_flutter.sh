#!/bin/bash

# Install Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verify Flutter installation
flutter --version

# Enable Flutter web
flutter config --enable-web

# Install dependencies
flutter pub get

# Build the web app
flutter build web
