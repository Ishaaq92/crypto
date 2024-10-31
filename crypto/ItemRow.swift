//
//  ItemRow.swift
//  crypto
//
//  Created by Ishaaq Ahmed on 29/10/2024.
//

import SwiftUI

struct ItemRow: View {
    let item: Cryptocurrency
    
    
    var body: some View {
        VStack{
            HStack {
                AsyncImage(url: URL(string: item.image))
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                    .cornerRadius(3)
                Text(item.name)
                    .font(.title3)
                    .multilineTextAlignment(.trailing)
                Spacer()
                Text("£\(String(item.current_price))")
            }
            
        }
        .cornerRadius(20)
    }
}

//#Preview {
//    var cryptoManager = CryptoManager()
//    
//    ItemRow(item: cryptoManager.cryptocurrencies.first)
//}
