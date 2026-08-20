import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locnavi_web_sdk/locnavi_web_sdk_method_channel.dart';

void main() {
  MethodChannelLocnaviWebSdk platform = MethodChannelLocnaviWebSdk();
  const MethodChannel channel = MethodChannel('locnavi_web_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      // getPlatformVersion 走 invokeMethod<String>，init/openMap 走
      // invokeMethod<int>，需依方法回傳對應型別，否則轉型會失敗。
      if (methodCall.method == 'getPlatformVersion') {
        return '42';
      }
      return 0;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('init', () async {
    expect(await platform.init('appKey'), 0);
  });

  test('openMap', () async {
    expect(await platform.openMap('mapId'), 0);
  });
}
