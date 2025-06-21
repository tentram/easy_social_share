import 'package:easy_social_share/easy_social_share_platform_interface.dart';

/// Android-specific social media sharing functionality.
///
/// This class provides methods for sharing content to various social media
/// platforms on Android devices. It supports both single and multiple file
/// sharing, with platform-specific optimizations for Android.
class Android {
  /// Shares a message and optional file to WhatsApp on Android.
  ///
  /// [message] The text message to share.
  /// [filePath] Optional path to an image or video file to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  ///
  /// Example:
  /// ```dart
  /// await easySocialShare.android.shareToWhatsapp(
  ///   "Check out this image!",
  ///   "/path/to/image.jpg"
  /// );
  /// ```
  Future<String> shareToWhatsapp(String message, String? filePath) {
    return EasySocialSharePlatform.instance.shareToWhatsappAndroid(
      message,
      filePath,
    );
  }

  /// Shares multiple files to WhatsApp on Android.
  ///
  /// [filePaths] List of file paths to share (images or videos).
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  ///
  /// Example:
  /// ```dart
  /// await easySocialShare.android.shareFilesToWhatsapp([
  ///   "/path/to/image1.jpg",
  ///   "/path/to/image2.jpg"
  /// ]);
  /// ```
  Future<String> shareFilesToWhatsapp(List<String> filePaths) {
    return EasySocialSharePlatform.instance.shareToWhatsappAndroidMultiFiles(
      filePaths,
    );
  }

  /// Shares a message and optional file to Telegram on Android.
  ///
  /// [message] The text message to share.
  /// [filePath] Optional path to an image or video file to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToTelegram(String message, String? filePath) {
    return EasySocialSharePlatform.instance.shareToTelegramAndroid(
      message,
      filePath,
    );
  }

  /// Shares multiple files to Telegram on Android.
  ///
  /// [filePaths] List of file paths to share (images or videos).
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareFilesToTelegram(List<String> filePaths) {
    return EasySocialSharePlatform.instance.shareToTelegramAndroidMultiFiles(
      filePaths,
    );
  }

  /// Shares a message and optional file to Twitter on Android.
  ///
  /// [message] The text message to share.
  /// [filePath] Optional path to an image or video file to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToTwitter(String message, String? filePath) {
    return EasySocialSharePlatform.instance.shareToTwitterAndroid(
      message,
      filePath,
    );
  }

  /// Shares a message to Instagram Direct Messages.
  ///
  /// [message] The text message to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToInstagramDirect(String message) {
    return EasySocialSharePlatform.instance.shareToInstagramDirect(message);
  }

  /// Shares a message and optional file to Instagram Feed.
  ///
  /// [message] The text message to share.
  /// [filePath] Optional path to an image or video file to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToInstagramFeed(String message, String? filePath) {
    return EasySocialSharePlatform.instance.shareToInstagramFeed(
      message,
      filePath,
    );
  }

  /// Shares multiple images to Instagram Feed on Android.
  ///
  /// [imagePaths] List of image file paths to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareFilesToInstagramFeed(List<String> imagePaths) {
    return EasySocialSharePlatform.instance.shareToInstagramFeedAndroid(
      imagePaths,
    );
  }

  /// Shares multiple videos to Instagram Reels on Android.
  ///
  /// [videoPaths] List of video file paths to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToInstagramReels(List<String> videoPaths) {
    return EasySocialSharePlatform.instance.shareToInstagramFeedAndroid(
      videoPaths,
    );
  }

  /// Shares a message to Facebook Messenger.
  ///
  /// [message] The text message to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToMessenger(String message) {
    return EasySocialSharePlatform.instance.shareToMessenger(message);
  }

  /// Copies text to the device clipboard.
  ///
  /// [message] The text to copy to clipboard.
  ///
  /// Returns a [String] indicating the result of the operation.
  Future<String> copyToClipBoard(String message) {
    return EasySocialSharePlatform.instance.copyToClipBoard(message);
  }

  /// Shares content to Facebook with hashtags and files.
  ///
  /// [hashtag] Hashtag to include with the post.
  /// [filePaths] List of file paths to share (images or videos).
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToFacebook(String hashtag, List<String> filePaths) {
    return EasySocialSharePlatform.instance.shareToFacebook(hashtag, filePaths);
  }

  /// Shares content to Instagram Stories with customizable background and sticker.
  ///
  /// [appId] Your Instagram app ID for attribution.
  /// [stickerImage] Optional path to sticker image file.
  /// [backgroundImage] Optional path to background image file.
  /// [backgroundVideo] Optional path to background video file.
  /// [backgroundTopColor] Optional hex color for gradient background top.
  /// [backgroundBottomColor] Optional hex color for gradient background bottom.
  /// [attributionURL] Optional URL for attribution link.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  ///
  /// Example:
  /// ```dart
  /// await easySocialShare.android.shareToInstagramStory(
  ///   'your_app_id',
  ///   backgroundImage: '/path/to/image.jpg',
  ///   stickerImage: '/path/to/sticker.png',
  /// );
  /// ```
  Future<String> shareToInstagramStory(
    String appId, {
    String? stickerImage,
    String? backgroundImage,
    String? backgroundVideo,
    String? backgroundTopColor,
    String? backgroundBottomColor,
    String? attributionURL,
  }) {
    return EasySocialSharePlatform.instance.shareToInstagramStory(
      appId,
      stickerImage: stickerImage,
      backgroundImage: backgroundImage,
      backgroundVideo: backgroundVideo,
      backgroundTopColor: backgroundTopColor,
      backgroundBottomColor: backgroundBottomColor,
      attributionURL: attributionURL,
    );
  }

  /// Shares content to Facebook Stories with customizable background and sticker.
  ///
  /// [appId] Your Facebook app ID for attribution.
  /// [stickerImage] Optional path to sticker image file.
  /// [backgroundImage] Optional path to background image file.
  /// [backgroundVideo] Optional path to background video file.
  /// [backgroundTopColor] Optional hex color for gradient background top.
  /// [backgroundBottomColor] Optional hex color for gradient background bottom.
  /// [attributionURL] Optional URL for attribution link.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToFacebookStory(
    String appId, {
    String? stickerImage,
    String? backgroundImage,
    String? backgroundVideo,
    String? backgroundTopColor,
    String? backgroundBottomColor,
    String? attributionURL,
  }) {
    return EasySocialSharePlatform.instance.shareToFacebookStory(
      appId,
      stickerImage: stickerImage,
      backgroundImage: backgroundImage,
      backgroundVideo: backgroundVideo,
      backgroundTopColor: backgroundTopColor,
      backgroundBottomColor: backgroundBottomColor,
      attributionURL: attributionURL,
    );
  }

  /// Shares files to TikTok Status (Android only).
  ///
  /// [filePaths] List of image or video file paths to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  ///
  /// Note: This method only works on Android devices.
  Future<String> shareToTiktokStatus(List<String> filePaths) {
    return EasySocialSharePlatform.instance.shareToTiktokStatus(filePaths);
  }

  /// Shares content using Android's system sharing dialog.
  ///
  /// [title] Title for the sharing dialog.
  /// [message] The text message to share.
  /// [filePath] Optional path to a file to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToSystem(String title, String message, String? filePath) {
    return EasySocialSharePlatform.instance.shareToSystemAndroid(
      title,
      message,
      filePath,
    );
  }

  /// Shares multiple files using Android's system sharing dialog.
  ///
  /// [title] Title for the sharing dialog.
  /// [filePaths] List of file paths to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareFilesToSystem(String title, List<String> filePaths) {
    return EasySocialSharePlatform.instance.shareToSystemAndroidMultifiles(
      title,
      filePaths,
    );
  }

  /// Shares a message and optional file via SMS on Android.
  ///
  /// [message] The text message to share.
  /// [filePath] Optional path to a file to attach.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToSMS(String message, String? filePath) {
    return EasySocialSharePlatform.instance.shareToSMSAndroid(
      message,
      filePath,
    );
  }

  /// Shares multiple files via SMS on Android.
  ///
  /// [filePaths] List of file paths to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareFilesToSMS(List<String> filePaths) {
    return EasySocialSharePlatform.instance.shareToSMSAndroidMultifiles(
      filePaths,
    );
  }
}
