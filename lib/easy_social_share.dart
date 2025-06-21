import 'package:easy_social_share/easy_social_share_platform_interface.dart';
import 'package:easy_social_share/platforms/android.dart';
import 'package:easy_social_share/platforms/ios.dart';

class EasySocialShare {
  Android android = Android();
  IOS iOS = IOS();

  Future<Map<String, bool>> getInstalledApps() async {
    return EasySocialSharePlatform.instance.getInstalledApps();
  }
}
