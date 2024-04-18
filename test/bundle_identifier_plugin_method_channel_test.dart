import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bundle_identifier_plugin/bundle_identifier_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBundleIdentifierPlugin platform = MethodChannelBundleIdentifierPlugin();
  const MethodChannel channel = MethodChannel('bundle_identifier_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
