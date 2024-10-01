//
//  ChangeVolumeTextView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct ChangeVolumeTextView: View {
    @State var numberChangeDisplay: String
    @State var isPositiveChange: Bool

    init(number: Double, isPositiveChange: Bool = true) {
        self.numberChangeDisplay = number.toDecimalString()
        self.isPositiveChange = isPositiveChange
    }

    var body: some View {
        HStack(spacing: 3) {
            Image(with: isPositiveChange ? .arrowUpIcon : .arrowDownIcon)
                .resizable()
                .frame(width: 12, height: 12, alignment: .center)
            Text(numberChangeDisplay)
                .font(CoinFont.Style.robotoBlack.swiftUIFont())
                .foregroundStyle(isPositiveChange
                                 ? Color(colorName: .topCoinGreenText)
                                 : Color(colorName: .topCoinRedText))
        }
    }
}
