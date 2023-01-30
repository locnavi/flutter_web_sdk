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
}
