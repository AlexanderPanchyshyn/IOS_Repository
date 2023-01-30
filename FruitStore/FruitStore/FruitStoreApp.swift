import SwiftUI
import Stripe

@main
struct FruitStoreApp: App {
    
    init() {
        StripeAPI.defaultPublishableKey = "pk_test_51MVkBnFNs2KtjUj0Xu3ORd0wt3J3yBuy3QCQtpnw43gGWYSsXKgBREOgPs8NOGgo6rHtCFqjZWYWDYvKRF3NDhBU00xynaqaeP"
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Cart())
        }
    }
}
