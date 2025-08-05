import StoreKit

struct PurchaseInfo:Codable {
    let accountId:String
    let quantity:Int
}

enum IapError: Error {
    case ProductNotLoaded
    case PurchaseCanceled
    case AccountIdError
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
        }
    }
}

// 用于获取商品信息
class StoreManager {

    // 全局单例对象
    static let shared = StoreManager()
    private let productIdentifiers: Set<String> = [
        "onecupofcoffee"
    ]
    var products: [Product] = [Product]()

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

}
