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
    case mainRoot
    case noteCoinView
    
    var id: String {
        switch self {
        case .mainRoot:
            return "mainRootView"
        case .noteCoinView:
            return "noteCoinView"
        }
    }
}

enum Sheet: Identifiable, Hashable {
    case success(onDismiss: (() -> Void)?)
    case coinDetail(coin: Coin)

    var id: String {
        switch self {
        case .success:
            return "successSheetView"
        case .coinDetail:
            return "coinDetailSheetView"
        }
    }

    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        switch self {
        case .success:
            hasher.combine(0)
        case .coinDetail:
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
        default:
            return false
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
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenOver: FullScreenOver?
    
    func push(_ screen:  Screen) {
        path.append(screen)
    }
    
    func present(sheet: Sheet) {
        switch sheet {
        case .success(let onDismiss):
            self.sheet = .success(onDismiss: onDismiss)
        case .coinDetail(let coin):
            self.sheet = .coinDetail(coin: coin)
        }
    }
    
    func fullScreenOver(fullScreenOver: FullScreenOver) {
        switch fullScreenOver {
        case .success(let onDismiss):
            self.fullScreenOver = .success(onDismiss: onDismiss)
        }
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count - 1) // path.count - 1 is not pop to SplashScreen
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenOver() {
        self.fullScreenOver = nil
    }
    
    @ViewBuilder
    func build(screen: Screen) -> some View {
        switch screen {
        case .mainRoot:
            MainRootView()
        case .noteCoinView:
            NoteCoinView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .success(let onDismiss):
            SuccessSheetView(onDismiss: onDismiss)
        case .coinDetail(let coin):
            CoinDetailView(detailCoin: coin)
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
