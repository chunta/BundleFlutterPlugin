// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'bundle_identifier_plugin_platform_interface.dart';
import 'package:flutter/services.dart';

class BundleIdentifierPlugin {
  Future<String?> getPlatformVersion() {
    return BundleIdentifierPluginPlatform.instance.getPlatformVersion();
  }

  static const MethodChannel _channel =
      MethodChannel('bundle_identifier_plugin');

  static Future<String> getBundleIdentifier() async {
    final String bundleIdentifier =
        await _channel.invokeMethod('getBundleIdentifier');
    return bundleIdentifier;
  }
}
