import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
     
      weak var registrar = self.registrar(forPlugin: "native-views-1")

      let factory = FLNativeViewFactory(messenger: registrar!.messenger())
      registrar?.register(
                  factory,
                  withId: "text-native-view")
      
      let factoryEmailText = EmailLinkTextFactory(messenger: registrar!.messenger())
      registrar?.register(
                  factoryEmailText,
                  withId: "email-text-native-view")
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
