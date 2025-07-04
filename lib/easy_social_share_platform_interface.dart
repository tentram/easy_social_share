import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'easy_social_share_method_channel.dart';

abstract class EasySocialSharePlatform extends PlatformInterface {
  /// Constructs a EasySocialSharePlatform.
  EasySocialSharePlatform() : super(token: _token);

  static final Object _token = Object();

  static EasySocialSharePlatform _instance = MethodChannelEasySocialShare();

  /// The default instance of [EasySocialSharePlatform] to use.
  ///
  /// Defaults to [MethodChannelEasySocialShare].
  static EasySocialSharePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EasySocialSharePlatform] when
  /// they register themselves.
  static set instance(EasySocialSharePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map<String, bool>> getInstalledApps() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///filaPath only works for android
  Future<String> shareToWhatsapp(String message, {List<String>? filePaths}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToInstagramDirect(String message) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToInstagramFeed(String message, String? filePath) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToInstagramFeedAndroid(List<String> filePaths) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToMessenger(String message) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///This function only works for android
  Future<String> shareToTiktokStatus(List<String> filePaths) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///This function only works for iOS
  Future<String> shareToTiktokPost(
    String filePath,
    String redirectUrl,
    TiktokFileType tiktokFileType,
  ) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToTwitter(String message, String? filePath) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///filepath only works for android
  Future<String> shareToTelegram(String message, {List<String>? filePaths}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToFacebook(String hashtag, List<String> filePaths) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToInstagramStory(
    String appId, {
    String? stickerImage,
    String? backgroundImage,
    String? backgroundVideo,
    String? backgroundTopColor,
    String? backgroundBottomColor,
    String? attributionURL,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToFacebookStory(
    String appId, {
    String? stickerImage,
    String? backgroundImage,
    String? backgroundVideo,
    String? backgroundTopColor,
    String? backgroundBottomColor,
    String? attributionURL,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> copyToClipBoard(String message) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToSystem(
    String title,
    String message, {
    List<String>? filePaths,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///filePath only works for android
  Future<String> shareToSMS(String message, {List<String>? filePaths}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToWhatsappAndroid(
    String message,
    String? filePath,
  ) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToWhatsappAndroidMultiFiles(
    List<String> filePaths,
  ) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToTelegramAndroid(
    String message,
    String? filePath,
  ) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToTelegramAndroidMultiFiles(
    List<String> filePaths,
  ) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToTwitterAndroid(String message, String? filePath) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToTwitterAndroidMultifiles(List<String> filePaths) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToSMSAndroid(String message, String? filePath) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToSMSAndroidMultifiles(List<String> filePaths) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToSystemAndroid(
    String title,
    String message,
    String? filePath,
  ) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareImageToWhatsApp(String filePath) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> shareToSystemAndroidMultifiles(
    String title,
    List<String> filePaths,
  ) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

/// Enum representing the type of file to be shared to TikTok.
///
/// This enum is used to specify whether the content being shared to TikTok
/// is an image or a video file.
///
/// Example usage:
/// ```dart
/// await easySocialShare.iOS.shareToTiktokPost(
///   '/path/to/video.mp4',
///   'https://your-app.com/redirect',
///   TiktokFileType.video,
/// );
/// ```
enum TiktokFileType {
  /// Represents an image file type for TikTok sharing.
  image("image"),

  /// Represents a video file type for TikTok sharing.
  video("video");

  /// The string value associated with the file type.
  final String value;

  /// Creates a TiktokFileType with the given [value].
  const TiktokFileType(this.value);
}
