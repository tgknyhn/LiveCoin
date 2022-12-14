//
//  CoinRowView.swift
//  LiveCoin
//
//  Created by Tuğkan Ayhan on 13.12.2022.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            // Coin Rank
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)

            // Coin Image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)

            VStack(alignment: .leading, spacing: 2) {
                // Coin Name
                Text(coin.name)
                    .font(.headline)
                    .padding(.leading, 4)
                
                // Coin Symbol
                Text(coin.symbol)
                    .font(.system(size: 12))
                    .padding(.leading, 4)
            }
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                // Current Coin Price
                Text(coin.currentPrice.toCurrency())
                    .font(.headline)
                
                // Price Change in 24h
                Text("\(coin.priceChange24H)")
                    .font(.system(size: 12))
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

/*
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView()
    }
}
*/
