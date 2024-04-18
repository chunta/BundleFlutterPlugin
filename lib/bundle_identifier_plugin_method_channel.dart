import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bundle_identifier_plugin_platform_interface.dart';

/// An implementation of [BundleIdentifierPluginPlatform] that uses method channels.
class MethodChannelBundleIdentifierPlugin extends BundleIdentifierPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bundle_identifier_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
