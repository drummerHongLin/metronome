import Flutter
import UIKit
import StoreKit


@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    Task{
      try?  await StoreManager.shared.loadProducts();
    }
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let paymentChannel = FlutterMethodChannel(
      name: "com.jinghong.metronome/purchase", binaryMessenger: controller.binaryMessenger)
    paymentChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "invokePurchase" {
        /*
          guard dlet argString = call.arguments as? String
          else{
              result(FlutterError(code: "UNAVAILABLE",
                                      message: "参数异常",
                                      details: nil))
              return
        } */
  //       let args = argString.data(using: .utf8)               
  //       let accountId = args["accountId"] as? String ?? ""
  //       let token = UUID(uuidString: accountId)
  //       let quantity = args["quantity"] as? Int ?? 0
      StoreManager.shared.invokePurchase(token: UUID(), quantity: 1){
              (response, error) in
              if let error = error {
                  result(FlutterError(code: "PURCHASEERROR", message: error.localizedDescription, details: nil))
              }else {
                  result(response)
              }
          }
      }
        else {
            result(FlutterMethodNotImplemented)
        }
    })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


  
}

