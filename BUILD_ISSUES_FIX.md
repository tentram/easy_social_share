# Build Issues Fix Guide

## Issues Identified

Based on the error logs, there are several issues causing the compilation problems:

### 1. Java Version Compatibility Mismatch
- **Problem**: The plugin's `android/build.gradle` was using Java 8, while the example app uses Java 11
- **Symptoms**: Warnings about obsolete Java 8 source/target values
- **Status**: ✅ **FIXED** - Updated plugin to use Java 11

### 2. Kotlin Incremental Compilation Cache Corruption
- **Problem**: Kotlin compiler cache has conflicting path references between pub cache and local project
- **Symptoms**: `IllegalArgumentException` with different file roots
- **Solution**: Clean build caches (see steps below)

### 3. Unchecked Java Operations
- **Problem**: Raw HashMap usage without generic type parameters
- **Symptoms**: "unchecked or unsafe operations" warnings
- **Status**: ✅ **FIXED** - Added proper generic type parameters

## Solutions Applied

### 1. Java Version Alignment ✅
Updated `android/build.gradle`:
```gradle
compileOptions {
    sourceCompatibility JavaVersion.VERSION_11  // Changed from VERSION_1_8
    targetCompatibility JavaVersion.VERSION_11  // Changed from VERSION_1_8
}
```

### 2. Fixed Unchecked Operations ✅
Updated `SocialShareUtil.java`:
- Changed `new HashMap()` to `new HashMap<>()`
- Changed `new ArrayList<Uri>()` to `new ArrayList<>()`

## Required Steps to Fix Cache Issues

### Option 1: Use the Provided Scripts

**For Windows:**
```bash
clean_build.bat
```

**For macOS/Linux:**
```bash
./clean_build.sh
```

### Option 2: Manual Steps

1. **Navigate to example directory:**
   ```bash
   cd example
   ```

2. **Clean Flutter:**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Clean Android build cache:**
   ```bash
   cd android
   ./gradlew clean  # On Windows: gradlew.bat clean
   ```

4. **Remove Kotlin incremental cache:**
   ```bash
   # Remove build directories
   rm -rf build
   rm -rf .gradle
   
   # On Windows:
   # rmdir /s /q build
   # rmdir /s /q .gradle
   ```

5. **Optional - Clean global Gradle cache (if issues persist):**
   ```bash
   # macOS/Linux:
   rm -rf ~/.gradle/caches
   
   # Windows:
   # rmdir /s /q "%USERPROFILE%\.gradle\caches"
   ```

6. **Return to example directory and test:**
   ```bash
   cd ..
   flutter run
   ```

## Additional Troubleshooting

### If Issues Persist:

1. **Check Flutter Doctor:**
   ```bash
   flutter doctor -v
   ```

2. **Update Flutter and Dependencies:**
   ```bash
   flutter upgrade
   flutter pub upgrade
   ```

3. **Clear Pub Cache:**
   ```bash
   flutter pub cache clean
   flutter pub get
   ```

4. **Restart IDE/Editor:**
   - Close and reopen your IDE
   - Restart any running Flutter/Dart analysis servers

### File Picker Specific Issues:
The error logs show issues with `file_picker-10.2.0`. If problems persist:

1. **Try downgrading file_picker:**
   ```yaml
   # In example/pubspec.yaml
   file_picker: ^8.0.0  # or another stable version
   ```

2. **Or remove file_picker temporarily to test:**
   - Comment out `file_picker` dependency
   - Remove any file_picker imports/usage
   - Test if the build works

## Expected Results

After applying these fixes:
- ✅ Java version warnings should disappear
- ✅ Unchecked operations warnings should disappear  
- ✅ Kotlin compilation cache errors should be resolved
- ✅ Example app should build and run successfully

## Prevention

To avoid similar issues in the future:
1. Keep Java versions consistent across all build.gradle files
2. Use proper generic types in Java code
3. Regularly clean build caches when switching between projects
4. Keep dependencies up to date but test thoroughly after updates
