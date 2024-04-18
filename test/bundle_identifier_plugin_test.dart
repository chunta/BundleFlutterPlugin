import 'package:flutter_test/flutter_test.dart';
import 'package:bundle_identifier_plugin/bundle_identifier_plugin.dart';
import 'package:bundle_identifier_plugin/bundle_identifier_plugin_platform_interface.dart';
import 'package:bundle_identifier_plugin/bundle_identifier_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBundleIdentifierPluginPlatform
    with MockPlatformInterfaceMixin
    implements BundleIdentifierPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BundleIdentifierPluginPlatform initialPlatform = BundleIdentifierPluginPlatform.instance;

  test('$MethodChannelBundleIdentifierPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBundleIdentifierPlugin>());
  });

  test('getPlatformVersion', () async {
    BundleIdentifierPlugin bundleIdentifierPlugin = BundleIdentifierPlugin();
    MockBundleIdentifierPluginPlatform fakePlatform = MockBundleIdentifierPluginPlatform();
    BundleIdentifierPluginPlatform.instance = fakePlatform;

    expect(await bundleIdentifierPlugin.getPlatformVersion(), '42');
  });
}
