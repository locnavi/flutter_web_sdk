import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'locnavi_web_sdk_method_channel.dart';

abstract class LocnaviWebSdkPlatform extends PlatformInterface {
  /// Constructs a LocnaviWebSdkPlatform.
  LocnaviWebSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static LocnaviWebSdkPlatform _instance = MethodChannelLocnaviWebSdk();

  /// The default instance of [LocnaviWebSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelLocnaviWebSdk].
  static LocnaviWebSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocnaviWebSdkPlatform] when
  /// they register themselves.
  static set instance(LocnaviWebSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> init(String appKey, {String? serverUrl, String? uploadApi, uploadInterval = 1000, List<String>? uuids, debug = false,String? userId }) async {
    throw UnimplementedError('setAppKey() has not been implemented.');
  }

  Future<int?> openMap(String mapId, [String? poi]) async {
    throw UnimplementedError('openMap() has not been implemented.');
  }
}
