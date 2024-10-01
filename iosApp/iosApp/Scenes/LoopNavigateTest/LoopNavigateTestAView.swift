//
//  LoopNavigateTestAView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 1/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct LoopNavigateTestAView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("LoopNavigateTest A View")
            
            Button {
                coordinator.push(.loopNavTestB)
            } label: {
                Text("Push B View ")
            }
        }
    }
}

#Preview {
    LoopNavigateTestAView()
}
