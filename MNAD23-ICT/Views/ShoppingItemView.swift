//
//  ContentView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct ShoppingItemView: View {
    
    @StateObject private var viewModel = ShopItemViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                List(viewModel.shopItems){ item in
                    HStack {
                        Image(item.name.lowercased())
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text("$\(item.price, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Stepper() {
                        }onIncrement: {
                            viewModel.increaseQuantity(for: item)
                        }onDecrement: {
                            viewModel.decreaseQuantity(for: item)
                        }
                        .padding()
                        Text("\(item.quantity)")
                    }
                }
                .listStyle(.plain)
                
                Spacer()
                
                Button {
                    viewModel.showCartView.toggle()
                }label: {
                    HStack  {
                        Image(systemName: "cart")
                        Text("Checkout")
                    }
                }
                .foregroundColor(.white)
                .padding(.horizontal,40)
                .padding(.vertical,20)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            .padding()
            .navigationDestination(isPresented: $viewModel.showCartView) {
                CartView()
            }
            .navigationTitle("Buy fresh Groceries")
        }
    }
}

#Preview {
    ShoppingItemView()
}
