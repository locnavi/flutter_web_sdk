import 'package:flutter_test/flutter_test.dart';
import 'package:locnavi_web_sdk/locnavi_web_sdk.dart';
import 'package:locnavi_web_sdk/locnavi_web_sdk_platform_interface.dart';
import 'package:locnavi_web_sdk/locnavi_web_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLocnaviWebSdkPlatform
    with MockPlatformInterfaceMixin
    implements LocnaviWebSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<int?> init(String appKey, {String? serverUrl, String? uploadApi, uploadInterval = 1000, List<String>? uuids, debug = false, String? userId}) => Future.value(0);

  @override
  Future<int?> openMap(String mapId, [String? poi]) => Future.value(0);
}

void main() {
  final LocnaviWebSdkPlatform initialPlatform = LocnaviWebSdkPlatform.instance;

  test('$MethodChannelLocnaviWebSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLocnaviWebSdk>());
  });

  test('getPlatformVersion', () async {
    LocnaviWebSdk locnaviWebSdkPlugin = LocnaviWebSdk();
    MockLocnaviWebSdkPlatform fakePlatform = MockLocnaviWebSdkPlatform();
    LocnaviWebSdkPlatform.instance = fakePlatform;

    expect(await locnaviWebSdkPlugin.getPlatformVersion(), '42');
  });

  test('init', () async {
    LocnaviWebSdk locnaviWebSdkPlugin = LocnaviWebSdk();
    MockLocnaviWebSdkPlatform fakePlatform = MockLocnaviWebSdkPlatform();
    LocnaviWebSdkPlatform.instance = fakePlatform;

    expect(await locnaviWebSdkPlugin.init('appKey'), 0);
  });

  test('openMap', () async {
    LocnaviWebSdk locnaviWebSdkPlugin = LocnaviWebSdk();
    MockLocnaviWebSdkPlatform fakePlatform = MockLocnaviWebSdkPlatform();
    LocnaviWebSdkPlatform.instance = fakePlatform;

    expect(await locnaviWebSdkPlugin.openMap('mapId'), 0);
  });
}
