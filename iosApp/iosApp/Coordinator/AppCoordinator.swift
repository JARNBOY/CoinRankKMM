//
//  AppCoordinator.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import Foundation
import SwiftUI

enum Screen: Identifiable, Hashable {
    case mainRoot
    
    var id: String {
        switch self {
        case .mainRoot:
            return "mainRootView"
        }
    }
}

enum Sheet: Identifiable, Hashable {
    case success(onDismiss: (() -> Void)?)

    var id: String {
        switch self {
        case .success:
            return "success"
        }
    }

    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        switch self {
        case .success:
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
            return "success"
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
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .success(let onDismiss):
            SuccessSheetView(onDismiss: onDismiss)
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
