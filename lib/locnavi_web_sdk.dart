
import 'locnavi_web_sdk_platform_interface.dart';

class LocnaviWebSdk {
  Future<String?> getPlatformVersion() {
    return LocnaviWebSdkPlatform.instance.getPlatformVersion();
  }
  Future<void> init(String appKey, {String? serverUrl, String? uploadApi, uploadInterval: 1000, List<String>? uuids, debug: false }) async {
    return LocnaviWebSdkPlatform.instance.init(appKey, serverUrl: serverUrl, uploadApi: uploadApi, uploadInterval: uploadInterval, uuids: uuids, debug: debug);
  }
  Future<void> openMap(String mapId, [String? poi]) async {
    return LocnaviWebSdkPlatform.instance.openMap(mapId, poi);
  }
}
