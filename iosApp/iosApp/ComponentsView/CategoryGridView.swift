//
//  CategoryGridView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 2/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct CategoryMenuTestGridView: View {
    // MARK: - PROPERTY
    @EnvironmentObject private var coordinator: AppCoordinator
    
    private let countGrid = 1
    var gridLayout: [GridItem] {
      return Array(repeating: GridItem(.flexible(), spacing: 10), count: countGrid)
    }
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: 10, pinnedViews: [], content: {
                
                Button {
                    coordinator.push(.loopNavTestA)
                } label: {
                    HStack(alignment: .center, spacing: 6) {
                        Text("Test Navigation Coordinator")
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
                }
                
                Button {
                    Constants.openURLWeb(url: "crank://page-open?page=screen-b")
                } label: {
                    HStack(alignment: .center, spacing: 6) {
                        Text("Test Deeplink Coordinator")
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
                }
                
            }) //: GRID
            .frame(height: CGFloat(countGrid) * 60)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }) //: SCROLL
    }
}
