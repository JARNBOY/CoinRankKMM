//
//  MainRootView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct MainRootView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @State var selectedTab = PageTab.homeTab
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                HomeCoinRankView()
                    .tag(PageTab.homeTab)
                ProfileView()
                    .tag(PageTab.profileTab)
            }
            
            CustomTabBarView(selectedTab: $selectedTab) { index in
                switch index {
                case .indexHomeTab:
                    selectedTab = PageTab.homeTab
                case .indexCenterTab:
                    selectedTab = PageTab.centerTab
                case .indexProfileTab:
                    selectedTab = PageTab.profileTab
                }
            }
        }
        .onReceive(coordinator.$rootTabSelected) { tab in
            selectedTab = tab
        }
    }
}

#Preview {
    MainRootView()
}
