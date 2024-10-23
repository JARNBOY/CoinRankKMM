//
//  TitleView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 1/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    // MARK: - PREVIEW
    var title: String
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
            
            Spacer()
        } //: HSTACK
        .padding(.horizontal)
        .padding(.top, 4)
        .padding(.bottom, 8)
    }
}
#Preview {
    TitleView(title: "Profile")
      .background(Color(colorName: .black30))
}
