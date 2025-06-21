#!/bin/bash
echo "Cleaning Flutter and Android build caches..."

# Navigate to example directory
cd example

# Clean Flutter
echo "Cleaning Flutter..."
flutter clean

# Clean pub cache
echo "Getting Flutter dependencies..."
flutter pub get

# Navigate to Android directory
cd android

# Clean Gradle
echo "Cleaning Gradle build..."
./gradlew clean

# Clean Kotlin incremental compilation cache
echo "Cleaning Kotlin incremental compilation cache..."
rm -rf build
rm -rf .gradle

# Clean global Gradle cache (optional - uncomment if needed)
# echo "Cleaning global Gradle cache..."
# rm -rf ~/.gradle/caches

# Navigate back to example root
cd ..

echo "Build cache cleanup completed!"
echo "You can now try running: flutter run"
