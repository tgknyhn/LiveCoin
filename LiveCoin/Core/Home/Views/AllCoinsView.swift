//
//  AllCoinsView.swift
//  LiveCoin
//
//  Created by Tuğkan Ayhan on 13.12.2022.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            // Main Header
            Text("All Coins")
                .font(.headline)
                .padding()
            
            // Hint Text
            HStack {
                Text("Coin")
                Spacer()
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            // All Coins ScrollView
            ScrollView {
                VStack {
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}

/*
struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView(viewModel: HomeViewModel())
    }
}
*/
