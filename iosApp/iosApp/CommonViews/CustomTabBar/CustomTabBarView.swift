//
//  CustomTabBarView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct CustomTabBarView: View {
    private let tabs: [PageTab] = [.homeTab,
                                   .centerTab,
                                   .profileTab] // home , button center, profile
    @State var selectedTab: PageTab = .homeTab
    
    var selectedIndex: ((IndexPageTab) -> ())?
    
    var body: some View {
        VStack(alignment: .center) {
            Rectangle()
                .opacity(0.3)
                .frame(height: 0.2)
            ZStack {
                HStack {
                    homeTabBar()
                    Spacer() // space of centerTabBar()
                    profileTabBar()
                } //HStack
                .padding(.horizontal, 60)
                .padding(.vertical, 10)
                
                centerTabBar()
                    .offset(y: -35)
                
            } //ZStack
        } //VStack
        .frame(maxWidth: .infinity)
        .fixedSize(horizontal: false, vertical: true)
        .background(.white)
    }
    
    private func getIconColor(icon: IconPageTab) -> Color {
        switch icon {
        case .icHomeTab:
            return Color.red
        case .icProfileTab:
            return Color.red
        default:
            return Color.black
        }
    }
    
    @ViewBuilder
    func homeTabBar() -> some View {
        Button {
            withAnimation(Animation.interactiveSpring(dampingFraction: 2)) {
                selectedTab = .homeTab
            }
            selectedIndex?(selectedTab.indexTab)
        } label: {
            Image(systemName: IconPageTab.icHomeTab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(selectedTab == .homeTab ? getIconColor(icon: selectedTab.icTab) : Color.gray)
        }
        .frame(width: 60, height: 32)
    }
    
    @ViewBuilder
    func centerTabBar() -> some View {
        Button {
            //TODO:
        } label: {
            Image(systemName: IconPageTab.icCenterTab.rawValue)
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundStyle(.red)
                .background(Circle().fill(.white))
        }
    }
    
    @ViewBuilder
    func profileTabBar() -> some View {
        Button {
            withAnimation(Animation.interactiveSpring(dampingFraction: 2)) {
                selectedTab = .profileTab
            }
            selectedIndex?(selectedTab.indexTab)
        } label: {
            Image(systemName: IconPageTab.icProfileTab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(selectedTab == .profileTab ? getIconColor(icon: selectedTab.icTab) : Color.gray)
        }
        .frame(width: 60, height: 32)
    }
}

#Preview {
    ZStack(alignment: .bottom) {
        Color.gray.opacity(0.2)
            .ignoresSafeArea()
        CustomTabBarView { index in
            print("CustomTabBarView index \(index)")
        }
    }
}
