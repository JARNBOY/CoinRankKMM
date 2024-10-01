//
//  AppCoordinator.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

enum Screen: Identifiable, Hashable {
    case mainRoot(selectedTab: PageTab)
    case noteCoinView
    case loopNavTestA
    case loopNavTestB
    case loopNavTestC
    case loopNavTestD
    
    var id: String {
        switch self {
        case .mainRoot:
            return "mainRootView"
        case .noteCoinView:
            return "noteCoinView"
        case .loopNavTestA:
            return "loopNavTestAiew"
        case .loopNavTestB:
            return "nloopNavTestBView"
        case .loopNavTestC:
            return "loopNavTestCiew"
        case .loopNavTestD:
            return "loopNavTestDView"
        }
    }
}

enum Sheet: Identifiable, Hashable {
    case success(onDismiss: (() -> Void)?)
    case coinDetail(coin: Coin)
    case webView(url: String)

    var id: String {
        switch self {
        case .success:
            return "successSheetView"
        case .coinDetail:
            return "coinDetailSheetView"
        case .webView:
            return "webSheetView"
        }
    }

    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        switch self {
        case .success:
            hasher.combine(0)
        case .coinDetail:
            hasher.combine(0)
        case .webView:
            hasher.combine(0)
        }
    }

    static func == (lhs: Sheet, rhs: Sheet) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        default:
            return false
        }
    }
}

enum FullScreenOver: Identifiable, Hashable {
    case success(onDismiss: (() -> Void)?)

    var id: String {
        switch self {
        case .success:
            return "successFullScreenView"
        }
    }

    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        switch self {
        case .success:
            hasher.combine(0)
        }
    }

    static func == (lhs: FullScreenOver, rhs: FullScreenOver) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        }
    }
}

protocol AppCoordinatorProtocol: ObservableObject {
    func push(_ screen:  Screen)
    func present(sheet: Sheet)
    func fullScreenOver(fullScreenOver: FullScreenOver)
    func pop()
    func popToRoot()
    func dismissSheet()
    func dismissFullScreenOver()
}

final class AppCoordinator: ObservableObject, AppCoordinatorProtocol {
    @Published var stackPaths = [Screen]()
    @Published var sheet: Sheet?
    @Published var fullScreenOver: FullScreenOver?
    @Published var rootTabSelected: PageTab = .homeTab
    
    func push(_ screen:  Screen) {
        stackPaths.append(screen)
    }
    
    func present(sheet: Sheet) {
        switch sheet {
        case .success(let onDismiss):
            self.sheet = .success(onDismiss: onDismiss)
        case .coinDetail(let coin):
            self.sheet = .coinDetail(coin: coin)
        case .webView(let url):
            self.sheet = .webView(url: url)
        }
    }
    
    func fullScreenOver(fullScreenOver: FullScreenOver) {
        switch fullScreenOver {
        case .success(let onDismiss):
            self.fullScreenOver = .success(onDismiss: onDismiss)
        }
    }
    
    func pop() {
        stackPaths.removeLast()
    }
    
    func popTo(screen: Screen) {
        if let indexPathPop = stackPaths.firstIndex(where: { $0 == screen }) {
            let popToIndex = (stackPaths.count - 1) - indexPathPop
            stackPaths.removeLast(popToIndex)
        } else {
            // Handle the case where the screen is not found
            print("Screen not found in stackPaths")
        }
    }
    
    func popToRoot() {
        stackPaths.removeLast(stackPaths.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenOver() {
        self.fullScreenOver = nil
    }
    
    func rebuildTabRootNotify(selectedTab: PageTab) {
        rootTabSelected = selectedTab
    }
    
    @ViewBuilder
    func build(screen: Screen) -> some View {
        switch screen {
        case .mainRoot(let selectedTab):
            MainRootView(selectedTab: selectedTab)
        case .noteCoinView:
            NoteCoinView()
        case .loopNavTestA:
            LoopNavigateTestAView()
        case .loopNavTestB:
            LoopNavigateTestBView()
        case .loopNavTestC:
            LoopNavigateTestCView()
        case .loopNavTestD:
            LoopNavigateTestDView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .success(let onDismiss):
            SuccessSheetView(onDismiss: onDismiss)
        case .coinDetail(let coin):
            CoinDetailView(detailCoin: coin)
        case .webView(let url):
            WebView(url: URL(string: url)!)
        }
    }
    
    @ViewBuilder
    func build(fullScreenOver: FullScreenOver) -> some View {
        switch fullScreenOver {
        case .success(let onDismiss):
            SuccessSheetView(onDismiss: onDismiss)
        }
    }
}
