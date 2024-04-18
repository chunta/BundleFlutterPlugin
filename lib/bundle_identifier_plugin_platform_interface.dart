import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bundle_identifier_plugin_method_channel.dart';

abstract class BundleIdentifierPluginPlatform extends PlatformInterface {
  /// Constructs a BundleIdentifierPluginPlatform.
  BundleIdentifierPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BundleIdentifierPluginPlatform _instance =
      MethodChannelBundleIdentifierPlugin();

  /// The default instance of [BundleIdentifierPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelBundleIdentifierPlugin].
  static BundleIdentifierPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BundleIdentifierPluginPlatform] when
  /// they register themselves.
  static set instance(BundleIdentifierPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() async {
    return "0.0.1";
  }
}
