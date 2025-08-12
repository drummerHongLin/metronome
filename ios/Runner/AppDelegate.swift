import Flutter
import UIKit
import StoreKit


@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let paymentChannel = FlutterMethodChannel(
        name: "com.jinghong.metronome/purchase", binaryMessenger: controller.binaryMessenger)
    
    StoreManager.shared.startTransactionListener(){
          (transactionInfo) in
        self.transactionUpdate(channel:paymentChannel , transactionInfo:transactionInfo)
      }
      
    Task{
      try?  await StoreManager.shared.loadProducts();
    }
    paymentChannel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          if call.method == "invokePurchase" {
              self?.invokePurchase(call: call, result: result)
          }
          else {
              result(FlutterMethodNotImplemented)
          }
      }
        )
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    
    // 和flutter通信区域
    // 1. 监听调用区域
    private func invokePurchase(call: FlutterMethodCall, result: @escaping FlutterResult) {
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
    
    // 2. 主动调用区域
    private func transactionUpdate(channel:FlutterMethodChannel, transactionInfo:String?){
        
        let c = transactionInfo ?? "false"
        
        
        channel.invokeMethod("updateTransaction", arguments: c) { result in
            guard let isSucess = result as? Bool
            else{
                print("更新交易数据异常")
                return
            }
            print("更新交易数据成功")
        }
    }
}

