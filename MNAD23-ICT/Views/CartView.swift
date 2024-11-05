//
//  CartView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct CartView: View {
    
    @StateObject private var viewModel = CartViewModel()
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading){
                if (viewModel.total > 0) {
                    List {
                        Section {
                            Text("Purchased items")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            ForEach (viewModel.purchasedItems){ item in
                                if item.quantity > 0 {
                                    HStack {
                                        Text("\(item.name)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Spacer()
                                        Text("\(viewModel.calculatePurchasedItems(item: item), specifier: "%.2f")")
                                    }
                                }
                            }
                        }
                        Section {
                            Text("Payment details")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            HStack {
                                Text("Net Amount")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("\(viewModel.total, specifier: "%.2f")")
                            }
                        }
                    }
                    .listStyle(.plain)
                }else {
                    VStack {
                        Text("Your Cart is Empty")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle("My Cart")
        
        VStack {
            Text("Your previouse deal with us was: \(viewModel.previousTotal, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal,20)
                .padding(.vertical, 20)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .onAppear {
            viewModel.calculateTotal()
            viewModel.previousTotal = UserDefaults.standard.double(forKey: "previouseTotal")
        }
        .onDisappear() {
            UserDefaults.standard.set(viewModel.total, forKey: "previouseTotal")
        }
    }
}

#Preview {
    CartView()
}
