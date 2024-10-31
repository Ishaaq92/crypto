//
//  models.swift
//  crypto
//
//  Created by Ishaaq Ahmed on 29/10/2024.
//

struct Cryptocurrency: Identifiable, Codable, Hashable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let market_cap: Double
    let price_change_percentage_24h: Double
}

import Foundation

class CryptoManager: ObservableObject {
    @Published var cryptocurrencies: [Cryptocurrency] = []
    var example: Cryptocurrency?

    func fetchCryptoData() async {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=gbp")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let cryptoData = try JSONDecoder().decode([Cryptocurrency].self, from: data)
            DispatchQueue.main.async {
                self.cryptocurrencies = cryptoData
                self.example = self.cryptocurrencies.first
            }
        } catch {
            print("Error fetching crypto data: \(error)")
        }
    }
}
