import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locnavi_web_sdk/locnavi_web_sdk_method_channel.dart';

void main() {
  MethodChannelLocnaviWebSdk platform = MethodChannelLocnaviWebSdk();
  const MethodChannel channel = MethodChannel('locnavi_web_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
