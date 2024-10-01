//
//  CoordinatorView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = AppCoordinator()
    private let deeplink: Deeplink = Deeplink.shared
    private var rootView: Screen = .mainRoot(selectedTab: .homeTab)
    
    var body: some View {
        NavigationStack(path: $coordinator.stackPaths) {
            coordinator.build(screen: rootView)
                .navigationDestination(for: Screen.self) { screen in
                    coordinator.build(screen: screen)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenOver) { fullScreenOver in
                    coordinator.build(fullScreenOver: fullScreenOver)
                }
        }
        .environmentObject(coordinator)
        .onOpenURL { incomingURL in
            print("App was opened via URL: \(incomingURL)")
            if let screen = deeplink.handleIncomingURL(incomingURL) {
                switch screen {
                case .mainRoot(let selectedTab):
                    coordinator.rebuildTabRootNotify(selectedTab: selectedTab)
                default:
                    coordinator.push(screen)
                }
                
            }
        }
    }
}
