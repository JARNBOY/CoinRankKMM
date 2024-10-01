//
//  LoopNavigateTestBView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 1/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct LoopNavigateTestBView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("LoopNavigateTest B View")
            
            Button {
                coordinator.push(.loopNavTestC)
            } label: {
                Text("Push C View ")
            }
            
            Button {
                coordinator.popToRoot()
            } label: {
                Text("PoptoRoot")
            }
        }
    }
}

#Preview {
    LoopNavigateTestBView()
}
