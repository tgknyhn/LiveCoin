//
//  TopMoversItemView.swift
//  LiveCoin
//
//  Created by Tuğkan Ayhan on 13.12.2022.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            // Coin Image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.orange)
                .padding(.vertical, 4)
            
            // Coin Symbol
            Text(coin.symbol.uppercased())
                .font(.caption)
                .fontWeight(.black)
            
            // Current Coin Price
            Text(coin.currentPrice.toCurrency())
                .font(.caption)
                .foregroundColor(.gray)
            
            // Price Change in 24h
            Text("\(coin.priceChange24H)")
                .font(.title3)
                .foregroundColor(.green)
        }
        .frame(width: 140, height: 140)
        .overlay(RoundedRectangle (cornerRadius: 20)
            .stroke (Color (.systemGray4), lineWidth: 3)
        )
        .padding(.vertical, 5)
        .padding(.leading, 2)
    }
}

/*
struct TopMoversItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversItemView()
    }
}
*/
