//
//  ProfileView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("ProfileView")
            
            Button {
                coordinator.push(.loopNavTestA)
            } label: {
                Text("Test PopTo like unwind Segue")
            }
        }
        
    }
}

#Preview {
    ProfileView()
}
