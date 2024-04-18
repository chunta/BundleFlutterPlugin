import Flutter
import UIKit

public class BundleIdentifierPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bundle_identifier_plugin", binaryMessenger: registrar.messenger())
    let instance = BundleIdentifierPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getBundleIdentifier":
      result(Bundle.main.bundleIdentifier)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
