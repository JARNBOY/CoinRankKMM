//
//  LoopNavigateTestCView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 1/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct LoopNavigateTestCView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("LoopNavigateTest C View")
            
            Button {
                coordinator.push(.loopNavTestD)
            } label: {
                Text("Push D View ")
            }
        }
    }
}

#Preview {
    LoopNavigateTestCView()
}
