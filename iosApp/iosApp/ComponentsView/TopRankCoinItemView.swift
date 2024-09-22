//
//  TopRankCoinItemView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGCoder

struct TopRankCoinItemView: View {
    let item: CoinItemModel
    private var onClick: () -> ()
    
    init(item: CoinItemModel, onClick: @escaping () -> ()) {
        self.item = item
        self.onClick = onClick
    }
    
    public var body: some View {
        Button(action: {
            onClick()
        }, label: {
            HStack(alignment: .center) {
                Spacer()
                VStack(alignment: .center, spacing: 8) {
                    WebImage(
                        url: URL(string: item.iconUrl),
                        options: [.continueInBackground],
                        context: [.imageThumbnailPixelSize: CGSize(width: 40, height: 40)]
                    )
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.top, 16)
                    .frame(width: 40, height: 40, alignment: .center)
                    Text(item.symbol)
                        .font(CoinFont.Style.robotoMedium.swiftUIFont(16))
                        .foregroundColor(Color(colorName: .black))
                        .padding(.top, 8)
                    Text(item.name)
                        .font(CoinFont.Style.robotoThin.swiftUIFont(16))
                        .foregroundColor(Color(colorName: .topCoinNameGrayText))
                        .lineLimit(1)
                    ChangeVolumeTextView(number: item.change, isPositiveChange: item.isChangePositive)
                        .padding(.bottom, 16)
                }
                Spacer()
            }
        })
        .padding(5)
        .background(Color(colorName: .bgtopCoin))
        .cornerRadius(8)
        .customShadow()
        .frame(minWidth: 110, minHeight: 140, alignment: .center)
    }
}
