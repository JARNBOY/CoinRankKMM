//
//  CategoryItemView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 2/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct CategoryItemView: View {
    // MARK: - PROPERTY
    let category: String
    
    // MARK: - BODY
    
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack(alignment: .center, spacing: 6) {
                
                Text(category)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                
                Spacer()
            } //: HSTACK
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }) //: BUTTON
    }
}

