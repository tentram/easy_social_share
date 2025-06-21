import 'package:easy_social_share/easy_social_share_platform_interface.dart';

class IOS {
  Future<String> shareToWhatsapp(String message) {
    return EasySocialSharePlatform.instance.shareToWhatsapp(message);
  }

  Future<String> shareToTelegram(String message) {
    return EasySocialSharePlatform.instance.shareToTelegram(message);
  }

  Future<String> shareImageToWhatsApp(String filePath) {
    return EasySocialSharePlatform.instance.shareImageToWhatsApp(filePath);
  }

  Future<String> shareToTwitter(String message, String? filePath) {
    return EasySocialSharePlatform.instance.shareToTwitter(message, filePath);
  }

  Future<String> shareToInstagramDirect(String message) {
    return EasySocialSharePlatform.instance.shareToInstagramDirect(message);
  }

  Future<String> shareToInstagramFeed(String imagePath) {
    return EasySocialSharePlatform.instance.shareToInstagramFeed("", imagePath);
  }

  Future<String> shareToInstagramReels(String videoPath) {
    return EasySocialSharePlatform.instance.shareToInstagramFeed("", videoPath);
  }

  Future<String> shareToMessenger(String message) {
    return EasySocialSharePlatform.instance.shareToMessenger(message);
  }

  Future<String> copyToClipBoard(String message) {
    return EasySocialSharePlatform.instance.copyToClipBoard(message);
  }

  Future<String> shareToFacebook(String hashtag, List<String> filePaths) {
    return EasySocialSharePlatform.instance.shareToFacebook(hashtag, filePaths);
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

  ///Works only after implementing native code provided here [https://pub.dev/packages/easy_social_share]
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

  Future<String> shareToSystem(String message, {List<String>? filePaths}) {
    return EasySocialSharePlatform.instance.shareToSystem(
      "",
      message,
      filePaths: filePaths,
    );
  }

  Future<String> shareToSMS(String message) {
    return EasySocialSharePlatform.instance.shareToSMS(message, filePaths: []);
  }
}
