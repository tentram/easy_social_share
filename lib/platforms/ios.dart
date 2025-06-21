import 'package:easy_social_share/easy_social_share_platform_interface.dart';

/// iOS-specific social media sharing functionality.
///
/// This class provides methods for sharing content to various social media
/// platforms on iOS devices. It integrates with iOS system sharing capabilities
/// and platform-specific features.
class IOS {
  /// Shares a text message to WhatsApp on iOS.
  ///
  /// [message] The text message to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  ///
  /// Example:
  /// ```dart
  /// await easySocialShare.iOS.shareToWhatsapp("Hello from iOS!");
  /// ```
  Future<String> shareToWhatsapp(String message) {
    return EasySocialSharePlatform.instance.shareToWhatsapp(message);
  }

  /// Shares a text message to Telegram on iOS.
  ///
  /// [message] The text message to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToTelegram(String message) {
    return EasySocialSharePlatform.instance.shareToTelegram(message);
  }

  /// Shares an image to WhatsApp on iOS.
  ///
  /// [filePath] Path to the image file to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  ///
  /// Example:
  /// ```dart
  /// await easySocialShare.iOS.shareImageToWhatsApp("/path/to/image.jpg");
  /// ```
  Future<String> shareImageToWhatsApp(String filePath) {
    return EasySocialSharePlatform.instance.shareImageToWhatsApp(filePath);
  }

  /// Shares a message and optional file to Twitter on iOS.
  ///
  /// [message] The text message to share.
  /// [filePath] Optional path to an image or video file to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToTwitter(String message, String? filePath) {
    return EasySocialSharePlatform.instance.shareToTwitter(message, filePath);
  }

  /// Shares a message to Instagram Direct Messages on iOS.
  ///
  /// [message] The text message to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToInstagramDirect(String message) {
    return EasySocialSharePlatform.instance.shareToInstagramDirect(message);
  }

  /// Shares an image to Instagram Feed on iOS.
  ///
  /// [imagePath] Path to the image file to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToInstagramFeed(String imagePath) {
    return EasySocialSharePlatform.instance.shareToInstagramFeed("", imagePath);
  }

  /// Shares a video to Instagram Reels on iOS.
  ///
  /// [videoPath] Path to the video file to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToInstagramReels(String videoPath) {
    return EasySocialSharePlatform.instance.shareToInstagramFeed("", videoPath);
  }

  /// Shares a message to Facebook Messenger on iOS.
  ///
  /// [message] The text message to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToMessenger(String message) {
    return EasySocialSharePlatform.instance.shareToMessenger(message);
  }

  /// Copies text to the device clipboard on iOS.
  ///
  /// [message] The text to copy to clipboard.
  ///
  /// Returns a [String] indicating the result of the operation.
  Future<String> copyToClipBoard(String message) {
    return EasySocialSharePlatform.instance.copyToClipBoard(message);
  }

  /// Shares content to Facebook with hashtags and files on iOS.
  ///
  /// [hashtag] Hashtag to include with the post.
  /// [filePaths] List of file paths to share (images or videos).
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  Future<String> shareToFacebook(String hashtag, List<String> filePaths) {
    return EasySocialSharePlatform.instance.shareToFacebook(hashtag, filePaths);
  }

  /// Shares content to Instagram Stories with customizable background and sticker on iOS.
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
  /// await easySocialShare.iOS.shareToInstagramStory(
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

  /// Shares content to Facebook Stories with customizable background and sticker on iOS.
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

  /// Shares a video to TikTok Post on iOS.
  ///
  /// This method requires implementing native code as described in the
  /// package documentation at https://pub.dev/packages/easy_social_share
  ///
  /// [videoFile] Path to the video file to share.
  /// [redirectUrl] URL to redirect after sharing.
  /// [tiktokFileType] Type of file being shared (image or video).
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  ///
  /// Example:
  /// ```dart
  /// await easySocialShare.iOS.shareToTiktokPost(
  ///   '/path/to/video.mp4',
  ///   'https://your-app.com/redirect',
  ///   TiktokFileType.video,
  /// );
  /// ```
  Future<String> shareToTiktokPost(
    String videoFile,
    String redirectUrl,
    TiktokFileType tiktokFileType,
  ) {
    return EasySocialSharePlatform.instance.shareToTiktokPost(
      videoFile,
      redirectUrl,
      tiktokFileType,
    );
  }

  /// Shares content using iOS system sharing dialog.
  ///
  /// [message] The text message to share.
  /// [filePaths] Optional list of file paths to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  ///
  /// Example:
  /// ```dart
  /// await easySocialShare.iOS.shareToSystem(
  ///   "Check out this content!",
  ///   filePaths: ["/path/to/image.jpg"]
  /// );
  /// ```
  Future<String> shareToSystem(String message, {List<String>? filePaths}) {
    return EasySocialSharePlatform.instance.shareToSystem(
      "",
      message,
      filePaths: filePaths,
    );
  }

  /// Shares a message via SMS on iOS.
  ///
  /// [message] The text message to share.
  ///
  /// Returns a [String] indicating the result of the sharing operation.
  ///
  /// Example:
  /// ```dart
  /// await easySocialShare.iOS.shareToSMS("Hello via SMS!");
  /// ```
  Future<String> shareToSMS(String message) {
    return EasySocialSharePlatform.instance.shareToSMS(message, filePaths: []);
  }
}
