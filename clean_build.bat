@echo off
echo Cleaning Flutter and Android build caches...

REM Navigate to example directory
cd example

REM Clean Flutter
echo Cleaning Flutter...
flutter clean

REM Clean pub cache
echo Getting Flutter dependencies...
flutter pub get

REM Navigate to Android directory
cd android

REM Clean Gradle
echo Cleaning Gradle build...
call gradlew clean

REM Clean Kotlin incremental compilation cache
echo Cleaning Kotlin incremental compilation cache...
if exist "build" rmdir /s /q "build"
if exist ".gradle" rmdir /s /q ".gradle"

REM Clean global Gradle cache (optional - uncomment if needed)
REM echo Cleaning global Gradle cache...
REM if exist "%USERPROFILE%\.gradle\caches" rmdir /s /q "%USERPROFILE%\.gradle\caches"

REM Navigate back to example root
cd ..

echo Build cache cleanup completed!
echo You can now try running: flutter run
