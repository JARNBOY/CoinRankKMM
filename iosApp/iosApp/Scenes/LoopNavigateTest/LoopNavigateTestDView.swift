//
//  LoopNavigateTestDView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 1/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct LoopNavigateTestDView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("LoopNavigateTest D View")
            
            Button {
                coordinator.pop()
            } label: {
                Text("Back to previous C View ")
            }
            
            Button {
                coordinator.popTo(screen: .loopNavTestB)
            } label: {
                Text("Back to B screen by pop To like UnWind")
            }
        }
    }
}

#Preview {
    LoopNavigateTestDView()
}
