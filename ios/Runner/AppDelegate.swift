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
    
        guard let argStringTemp = call.arguments,
              let argString = argStringTemp as? String,
              let argData = argString.data(using: .utf8)
          else{
              result(FlutterError(code: "UNAVAILABLE",
                                      message: "参数异常",
                                      details: nil))
              return
        }
          do {
              let purchaseInfo = try  JSONDecoder().decode(PurchaseInfo.self, from: argData)
              StoreManager.shared.invokePurchase(purchaseInfo: purchaseInfo){
              (response, error) in
              if let error = error {
                  result(FlutterError(code: "PURCHASEERROR", message: error.localizedDescription, details: nil))
              }else {
                  result(response)
              }
            }
          }
          catch{
              result(FlutterError(code: "UNAVAILABLE",
                                      message: "参数异常",
                                      details: nil))
              return
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

