import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'locnavi_web_sdk_platform_interface.dart';

/// An implementation of [LocnaviWebSdkPlatform] that uses method channels.
class MethodChannelLocnaviWebSdk extends LocnaviWebSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('locnavi_web_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> init(String appKey, {String? serverUrl, String? uploadApi, uploadInterval: 1000, List<String>? uuids, debug: false }) async {
    return methodChannel.invokeMethod<void>('init', {
      'appKey': appKey,
      'serverUrl': serverUrl,
      'uploadApi': uploadApi,
      'uploadInterval': uploadInterval,
      'uuids': uuids,
      'debug': debug
    });
    return;
  }

  @override
  Future<void> openMap(String mapId, [String? poi]) async {
    return methodChannel.invokeMethod<void>('openMap', {
      'mapId': mapId,
      'poi': poi
    });
    return;
  }
}
