//
//  ContentView.swift
//  crypto
//
//  Created by Ishaaq Ahmed on 29/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cryptoManager = CryptoManager()
    @State private var searchText = ""
    
    
    var searchResults: [Cryptocurrency] {
        let list: [Cryptocurrency] = cryptoManager.cryptocurrencies.count >= 20
                    ? Array(cryptoManager.cryptocurrencies[0..<20])
                    : cryptoManager.cryptocurrencies

        if searchText.isEmpty {
            return list
        } else {
            return list.filter { $0.name.contains(searchText) || $0.symbol.contains(searchText)}
        }
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(searchResults) { crypto in
                    NavigationLink(value: crypto){
                        ItemRow(item: crypto)
                    }
                }
            }
            .navigationDestination(for: Cryptocurrency.self){ crypto in
                CryptoDetailView(item: crypto)
            }
            .task {
                await cryptoManager.fetchCryptoData()
            }
            .navigationTitle("Cryptocurrencies")
        }
        .searchable(text: $searchText, prompt: "Search Cryptocurrencies")
    }
}



#Preview {
    ContentView()
}
