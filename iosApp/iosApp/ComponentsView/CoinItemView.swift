//
//  CoinItemView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import shared

struct CoinItemView: View, Equatable {
    static func == (lhs: CoinItemView, rhs: CoinItemView) -> Bool {
        return lhs.item.uuid == rhs.item.uuid
    }
    
    let item: Coin
    var onClick: (() -> Void)?
    
    var body: some View {
        Button(action: {
            self.onClick?()
        }, label: {
            VStack {
                HStack(alignment: .top) {
                    WebImage(
                        url: URL(string: item.iconUrl),
                        options: [.continueInBackground],
                        context: [.imageThumbnailPixelSize: CGSize(width: 40, height: 40)]
                    )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Capsule())
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.vertical, 0)
                    .padding(.horizontal, 16)
                    VStack(spacing: 5) {
                        HStack {
                            Text(item.name)
                                .font(CoinFont.Style.robotoBold.swiftUIFont(16))
                                .foregroundStyle(Color(colorName: .coinItemBlackText))
                                .lineLimit(1)
                            Spacer(minLength: 8)
                            let priceText = "$\(item.price.toDecimalString(5))"
                            Text(priceText)
                                .font(CoinFont.Style.robotoBold.swiftUIFont(12))
                                .foregroundStyle(Color(colorName: .coinItemBlackText))
                        }
                        HStack {
                            Text(item.symbol)
                                .font(CoinFont.Style.robotoBold.swiftUIFont())
                                .foregroundStyle(Color(colorName: .topCoinNameGrayText))
                            Spacer()
                            ChangeVolumeTextView(number: item.change, isPositiveChange: item.isChangePositive)
                        }
                    }
                    .padding(.trailing, 16)
                }
                .padding(.vertical, 20)
            }
            .frame(height: 82, alignment: .center)
        })
        .padding(5)
        .background(Color(colorName: .bgtopCoin))
        .cornerRadius(8)
        .customShadow()
    }
}
