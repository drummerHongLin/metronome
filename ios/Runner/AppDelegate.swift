import Flutter
import UIKit
import StoreKit


@main
@objc class AppDelegate: FlutterAppDelegate {
  let iapObserver = StoreObserver()
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 获取商品信息
    ProductManager.shared.loadProducts()
    // 配置支付监听
    SKPaymentQueue.default().add(iapObserver)

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let paymentChannel = FlutterMethodChannel(
      name: "com.jinghong.metronome/payment", binaryMessenger: controller.binaryMessenger)
    paymentChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      if call.method == "invokePayment" {
        
      }
    })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func applicationWillTerminate(_ application: UIApplication) {
        // Remove the observer.
        SKPaymentQueue.default().remove(iapObserver)
    }
  
}

