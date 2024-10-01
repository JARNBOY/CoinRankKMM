//
//  CoinDetailView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 1/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI
import shared
import SDWebImageSwiftUI

struct CoinDetailView: View {
    @State var detailCoin: Coin
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            // Content Sheet
            VStack(alignment: .leading, spacing: 16) {
                contentView(item: detailCoin)
            }
            .padding(EdgeInsets(top: 32, leading: 24, bottom: 0, trailing: 4))
            
            // Button open URL
            buttonOpenURL(item: detailCoin)
        }
        .background(.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}

extension CoinDetailView {
    @ViewBuilder
    private func contentView(item: Coin) -> some View {
        // header
        HStack(alignment: .top, spacing: 16) {
            WebImage(
                url: URL(string: item.iconUrl),
                options: [.continueInBackground],
                context: [.imageThumbnailPixelSize: CGSize(width: 40, height: 40)]
            )
            .resizable()
            .clipShape(Capsule())
            .aspectRatio(contentMode: .fill)
            .padding(.vertical, 0)
            .padding(.horizontal, 16)
            .frame(width: 40, height: 40, alignment: .center)
            
            VStack(alignment: .leading, spacing: 6) {
                // name coin
                HStack(spacing: 4) {
                    Text(item.name)
                        .font(CoinFont.Style.robotoBold.swiftUIFont(18))
                        .foregroundColor(Color(hex: item.hexColor))
                        .lineLimit(1)
                    Text("(\(item.symbol))")
                        .font(CoinFont.Style.robotoRegular.swiftUIFont(16))
                        .foregroundColor(Color(colorName: .black))
                        .lineLimit(1)
                    Spacer()
                }
                // price coin
                HStack(spacing: 4) {
                    Text("PRICE")
                        .font(CoinFont.Style.robotoBold.swiftUIFont(12))
                        .foregroundColor(Color(colorName: .coinItemBlackText))
                        .lineLimit(1)
                    Text("$ \(item.price.toDecimalString())")
                        .font(CoinFont.Style.robotoRegular.swiftUIFont(12))
                        .foregroundColor(Color(colorName: .coinItemBlackText))
                        .lineLimit(1)
                    Spacer()
                }
                
                // market cap coin
                HStack(spacing: 4) {
                    Text("MARKET CAP")
                        .font(CoinFont.Style.robotoBold.swiftUIFont(12))
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Text("$ \(item.marketCap.toMarketCapFormat())")
                        .font(CoinFont.Style.robotoRegular.swiftUIFont(12))
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Spacer()
                }
            }
        }
        
        // description
        HTMLView(descHTMLString: item.description)
        
    }
    
    @ViewBuilder
    private func buttonOpenURL(item: Coin) -> some View {
        if !item.websiteUrl.isEmpty {
            Divider()
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Button(action: {
                        Constants.openURLWeb(url: item.websiteUrl)
                    }, label: {
                        Text("GO TO WEBSITE")
                            .font(CoinFont.Style.robotoBold.swiftUIFont())
                            .foregroundColor(Color(colorName: .btnOpenWebSiteText))
                    })
                }
            }
            .frame(height: 50)
        }
    }
}


//#Preview {
//    
//    CoinDetailView(
//        detailCoin: Coin(iconUrl: "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg",
//                   name: "Bitcoin",
//                   symbol: "BTC",
//                   price: 63620.03559721783,
//                   change: -1.20,
//                   uuid: "Qwsogvtv82FCd",
//                   rank: 1,
//                   isChangePositive: -1.20 > 0
//                  )
//    )
//}
