import 'package:easy_social_share/easy_social_share_platform_interface.dart';
import 'package:easy_social_share/platforms/android.dart';
import 'package:easy_social_share/platforms/ios.dart';

/// A Flutter plugin for easy social media sharing across multiple platforms.
///
/// This plugin provides a unified interface for sharing content to various
/// social media platforms including WhatsApp, Instagram, Facebook, Twitter,
/// TikTok, and system's built-in sharing dialog.
///
/// Example usage:
/// ```dart
/// EasySocialShare easySocialShare = EasySocialShare();
///
/// // Check installed apps
/// Map<String, bool> apps = await easySocialShare.getInstalledApps();
///
/// // Share to WhatsApp (Android)
/// await easySocialShare.android.shareToWhatsapp("Hello!", "/path/to/image.jpg");
///
/// // Share to system (iOS)
/// await easySocialShare.iOS.shareToSystem("Hello!", filePaths: ["/path/to/image.jpg"]);
/// ```
class EasySocialShare {
  /// Android-specific sharing methods.
  ///
  /// Provides access to Android-specific social media sharing functionality
  /// including support for multiple file sharing and platform-specific features.
  Android android = Android();

  /// iOS-specific sharing methods.
  ///
  /// Provides access to iOS-specific social media sharing functionality
  /// with iOS system integration and platform-specific features.
  IOS iOS = IOS();

  /// Checks which social media apps are installed on the device.
  ///
  /// Returns a [Map] where keys are app identifiers and values indicate
  /// whether the app is installed. Supported apps include:
  /// - 'whatsapp': WhatsApp
  /// - 'instagram': Instagram
  /// - 'facebook': Facebook
  /// - 'twitter': Twitter
  /// - 'telegram': Telegram
  /// - 'messenger': Facebook Messenger
  /// - 'tiktok': TikTok
  /// - 'instagram_stories': Instagram Stories
  /// - 'facebook_stories': Facebook Stories
  ///
  /// Example:
  /// ```dart
  /// Map<String, bool> apps = await easySocialShare.getInstalledApps();
  /// if (apps['whatsapp'] == true) {
  ///   // WhatsApp is installed, proceed with sharing
  /// }
  /// ```
  Future<Map<String, bool>> getInstalledApps() async {
    return EasySocialSharePlatform.instance.getInstalledApps();
  }
}
