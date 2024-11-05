//
//  ShopItemViewModel.swift
//  MNAD23-ICT
//
//  Created by Sithum Raveesha on 2024-11-05.
//

import Foundation

final class ShopItemViewModel: ObservableObject {
    
    @Published var shopItems: [ShopItem] = ShopItemRepository.shared.shopItems
    @Published var showCartView = false
    
    func increaseQuantity(for shopItem: ShopItem) {
        let selectedShopItem = shopItems.first(where: { $0.name == shopItem.name })!
        if selectedShopItem.quantity < 10 {
            selectedShopItem.quantity += 1
            shopItems = shopItems
        }
        
        var newShopItems: [ShopItem] = []
        shopItems.forEach {
            if $0.name == selectedShopItem.name {
                newShopItems.append(selectedShopItem)
            } else {
                newShopItems.append($0)
            }
        }
        
        shopItems = newShopItems
    }
    
    func decreaseQuantity(for shopItem: ShopItem) {
        let selectedShopItem = shopItems.first(where: { $0.name == shopItem.name })!
        if selectedShopItem.quantity > 0 {
            selectedShopItem.quantity -= 1
            shopItems = shopItems
        }
        
        var newShopItems: [ShopItem] = []
        shopItems.forEach {
            if $0.name == selectedShopItem.name {
                newShopItems.append(selectedShopItem)
            } else {
                newShopItems.append($0)
            }
        }
    }
}
