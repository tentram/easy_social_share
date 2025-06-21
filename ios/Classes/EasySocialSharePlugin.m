#import "EasySocialSharePlugin.h"
#if __has_include(<easy_social_share/easy_social_share-Swift.h>)
#import <easy_social_share/easy_social_share-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "easy_social_share-Swift.h"
#endif

@implementation EasySocialSharePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEasySocialSharePlugin registerWithRegistrar:registrar];
}
@end
