#import "LocnaviWebSdkPlugin.h"
#import <LocNaviWebSDK/LocNaviWebSDK.h>

@implementation LocnaviWebSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"locnavi_web_sdk"
            binaryMessenger:[registrar messenger]];
  LocnaviWebSdkPlugin* instance = [[LocnaviWebSdkPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"init" isEqualToString:call.method]) {
      NSString *appKey = call.arguments[@"appKey"];
      NSObject *obj = call.arguments[@"serverUrl"];
      NSString *serverUrl = [obj isKindOfClass:[NSNull class]] ? nil : (NSString*)obj;
      obj = call.arguments[@"uploadApi"];
      NSString *uploadApi = [obj isKindOfClass:[NSNull class]] ? nil : (NSString*)obj;
      obj = call.arguments[@"uploadInterval"];
      int uploadInterval = [obj isKindOfClass:[NSNull class]] ? 0 : [(NSNumber*)obj intValue];
      obj = call.arguments[@"uuids"];
      NSArray *uuids = [obj isKindOfClass:[NSNull class]] ? nil : (NSArray*)obj;
//      BOOL debug = [call.arguments[@"debug"] boolValue];
      
      if (appKey && appKey.length) {
          [LocNaviMapService setAppKey:appKey];
      }
      
      if (serverUrl) {
          [LocNaviMapService setServerUrl:serverUrl];
      }
      
      if (uuids) {
          [LocNaviMapService setUUIDs: uuids];
      }
      
      if (uploadApi) {
          [LocNaviMapService setUploadLocationApi:uploadApi timeInterval:uploadInterval];
      }
      result(0);
  } else if ([@"openMap" isEqualToString:call.method]) {
      NSString *mapId = call.arguments[@"mapId"];
      NSString *poi = call.arguments[@"poi"];

      UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
      if (!rootVC) {
        result(-1);
        return;
      }
      LocNaviWebViewController *vc;
      if (!poi || [poi isKindOfClass:[NSNull class]] || poi.length == 0 ) {
        vc = [[LocNaviWebViewController alloc] initWithMapId:mapId];
      } else {
        vc = [[LocNaviWebViewController alloc] initWithMapId:mapId poi:poi];
      }
      vc.modalPresentationStyle = UIModalPresentationFullScreen;
      [rootVC presentViewController:vc animated:YES completion:nil];
      result(0);
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
