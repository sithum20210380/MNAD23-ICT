//
//  CartViewModel.swift
//  MNAD23-ICT
//
//  Created by Sithum Raveesha on 2024-11-05.
//

import SwiftUI

final class CartViewModel: ObservableObject {
    
    @Published var purchasedItems: [ShopItem] = ShopItemRepository.shared.shopItems
    @Published var total: Double = 0
    @AppStorage("previousTotal") var previousTotal: Double = 0
    
    func calculatePurchasedItems(item: ShopItem) -> Double {
        return item.price * Double(item.quantity)
    }
    
    func calculateTotal() {
        for item in purchasedItems {
            total += calculatePurchasedItems(item: item)
        }
    }
}
