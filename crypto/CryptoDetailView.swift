//
//  CryptoDetailView.swift
//  crypto
//
//  Created by Ishaaq Ahmed on 29/10/2024.
//

import SwiftUI

struct CryptoDetailView: View {
    let item: Cryptocurrency

    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string: item.image))
                    .frame(width: 128, height: 128)
                    .clipShape(.rect(cornerRadius: 15))
                Spacer()
                VStack{
                    Text("£\(String(item.current_price))")
                        .font(.largeTitle)
                    if item.price_change_percentage_24h >= 0 {
                        Text(String(item.price_change_percentage_24h))
                            .foregroundStyle(.green)
                    }else{
                        Text(String(item.price_change_percentage_24h))
                            .foregroundStyle(.red)
                    }
                }
                Text(String(item.market_cap))
            }
            .padding()
            Spacer()
        }
        .navigationTitle(item.name)
    }
}

//#Preview {
//    CryptoDetailView()
//}
