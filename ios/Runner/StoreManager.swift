import StoreKit

// 用于获取商品信息
class ProductManager: NSObject, SKProductsRequestDelegate {

    // 全局单例对象
    static let shared = ProductManager()
    private   let productIdentifiers: Set<String> = [
        "onecupofcoffee"
    ]

    private var request: SKProductsRequest!

    func loadProducts() {
        // 如果已经获取过了，那么就不获取了
        guard products.isEmpty else {return}
        let productIdentifiers = productIdentifiers
        request = SKProductsRequest(productIdentifiers: productIdentifiers)
        request.delegate = self
        request.start()
    }

    var products = [SKProduct]()

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if !response.products.isEmpty {
            products = response.products
            print("成功加载 \(self.products.count) 个商品")
        }
        self.request = nil
    }

    func request(_ request: SKRequest, didFailWithError error: any Error) {
        // 待完成，通知flutter获取商品失败
        self.request = nil
    }

}

// 用于监听交易状态
class StoreObserver:NSObject,SKPaymentTransactionObserver{

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
        switch transaction.transactionState {
        case .purchasing: break
        // Don’t block the UI. Allow the user to continue using the app.
        case .deferred: print("推迟交易")
        // The purchase was successful.
        case .purchased: handlePurchased(transaction:  transaction)
        // The transaction failed.
        case .failed: handleFailed(transaction:transaction)
        // There are restored products.
        case .restored: handleRestored(transaction:transaction)
        @unknown default: fatalError("交易失败")
        }
    }
    }

    func handlePurchased(transaction:SKPaymentTransaction){
        SKPaymentQueue.default().finishTransaction(transaction)
    }   
    func handleFailed(transaction:SKPaymentTransaction){
        SKPaymentQueue.default().finishTransaction(transaction)
    }
    func handleRestored(transaction:SKPaymentTransaction){
        SKPaymentQueue.default().finishTransaction(transaction)
    }
    
}