
import 'locnavi_web_sdk_platform_interface.dart';

class LocnaviWebSdk {
  Future<String?> getPlatformVersion() {
    return LocnaviWebSdkPlatform.instance.getPlatformVersion();
  }
  Future<int?> init(String appKey, {String? serverUrl, String? uploadApi, uploadInterval = 1000, List<String>? uuids, debug = false,String? userId }) async {
    return LocnaviWebSdkPlatform.instance.init(appKey, serverUrl: serverUrl, uploadApi: uploadApi, uploadInterval: uploadInterval, uuids: uuids, debug: debug, userId: userId);
  }
  Future<int?> openMap(String mapId, [String? poi]) async {
    return LocnaviWebSdkPlatform.instance.openMap(mapId, poi);
  }
}
