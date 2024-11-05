//
//  ShopItemRepository.swift
//  MNAD23-ICT
//
//  Created by Sithum Raveesha on 2024-11-05.
//

import Foundation

final class ShopItemRepository: ObservableObject {
    static let shared = ShopItemRepository()
    
    @Published var shopItems: [ShopItem] = [
        ShopItem(name: "Broccoli", price: 5.00, quantity: 0),
        ShopItem(name: "Banana", price: 10.00, quantity: 0),
        ShopItem(name: "Avocado", price: 7.00, quantity: 0),
        ShopItem(name: "Chicken", price: 20.00 , quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 0),
    ]
    
    private init() {}
}
