import StoreKit

struct PurchaseInfo:Codable {
    let accountId:String
    let quantity:Int
}

enum IapError: Error {
    case ProductNotLoaded
    case PurchaseCanceled
    case AccountIdError
    case FailToUpdate
}

extension IapError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .ProductNotLoaded:
            return NSLocalizedString("商品加载失败", comment: "")
        case .PurchaseCanceled:
            return NSLocalizedString("用户取消购买", comment: "")
        case .AccountIdError:
            return NSLocalizedString("用户ID错误", comment: "")
        case .FailToUpdate:
            return NSLocalizedString("交易更新失败", comment: "")
        }
    }
}

// 用于获取商品信息
class StoreManager {

    // 全局单例对象
    static let shared = StoreManager()
    private let productIdentifiers: Set<String> = [
        "jinghong_metronome_coffee_1"
    ]
    // 交易更新任务
    private var transactionUpdatesTask: Task<Void, Never>?
    
    
    var products: [Product] = [Product]()
    
    // 1. 加载已建档商品
    func loadProducts() async throws {
        // 如果已经获取过了，那么就不获取了
        guard products.isEmpty else {
            return
        }
        guard let appProducts = try? await Product.products(for: productIdentifiers) else {
            throw IapError.ProductNotLoaded
        }

        products = appProducts

    }
    // 2. 调起系统支付
    func invokePurchase(purchaseInfo:PurchaseInfo, completion: @escaping (String?, Error?) -> Void)
    {
        Task {
            if products.isEmpty {
                do { try await loadProducts() } catch {
                    completion("", error)
                    return
                }
            }

            do {
                guard let token = UUID(uuidString:purchaseInfo.accountId)
                else {
                    completion(nil, IapError.AccountIdError)
                    return
                }
                let purchaseResult: Product.PurchaseResult = try await products[0].purchase(
                    options: [
                        .appAccountToken(token),
                        .quantity(purchaseInfo.quantity),
                    ])
                switch purchaseResult {
                case .success(let verificationResult):
                    switch verificationResult {
                    case .verified(let transaction):
                        completion(transaction.jsonRepresentation.base64EncodedString(), nil)
                         await transaction.finish()
                    case .unverified(_, let VerificationError):
                        completion(nil, VerificationError)
                    }
                   
                case .pending:
                    break
                case .userCancelled:
                    completion(nil, IapError.PurchaseCanceled)
                    break
                @unknown default:
                    break
                }

            } catch {
                completion("", error)
                return
            }

            return
        }
    }
    
    // 3. 监控交易更新，如应用停止后购买
    func startTransactionListener(completion: @escaping (String?) -> Void) {
        // 确保只创建一个监听任务
        guard transactionUpdatesTask == nil else { return }
        
        transactionUpdatesTask = Task(priority: .background) {
            for await update in Transaction.updates {
                await self.handle(transaction: update,completion: completion)
            }
        }
    }
    
    
    private func handle(transaction: VerificationResult<Transaction>, completion: @escaping (String?) -> Void) async {
        guard case .verified(let tx) = transaction else {
            // 验证失败：记录日志
            completion(nil)
            return
        }
        
        // 通知购买成功
        completion(tx.jsonRepresentation.base64EncodedString())
        
        // 结束交易（必须调用）
        await tx.finish()
    }

}
