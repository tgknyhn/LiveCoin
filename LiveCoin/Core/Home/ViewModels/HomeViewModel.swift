//
//  HomeViewModel.swift
//  LiveCoin
//
//  Created by Tuğkan Ayhan on 14.12.2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        // URL string received from https://www.coingecko.com/en/api/documentation
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        // Getting URL Object
        guard let url = URL(string: urlString) else { return }
        // Starting the URLSession
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Error check
            if let error = error {
                print("DEBUG: Error ->\(error.localizedDescription)")
                return
            }
            // Response control
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response -> \(response.statusCode)")
            }
            // from Data? to Data
            guard let data = data else { return }
            // Using data to fill coin object array
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                
                DispatchQueue.main.async {
                    self.coins = coins
                    self.topMovingCoins = self.getTopMovingCoins(moverSize: 5)
                }
            } catch let error {
                print("DEBUG: Error occured while decoding JSON file -> \(error)")
            }
        }.resume()
    }
    
    func getTopMovingCoins(moverSize: Int) -> Array<Coin> {
        let topMovers = coins.sorted { $0.priceChange24H > $1.priceChange24H }
        return Array(topMovers.prefix(moverSize))
    }
}
