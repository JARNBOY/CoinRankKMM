//
//  Deeplink.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 1/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import Foundation
import SwiftUI

let appDeeplink = "crank"
let pathActionOpenScreen = "page-open"

class Deeplink {
    static let shared = Deeplink()
    
    /// Handles the incoming URL and performs validations before acknowledging.
    func handleIncomingURL(_ url: URL) -> Screen? {
        guard url.scheme == appDeeplink else {
            return nil
        }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            print("Invalid URL")
            return nil
        }
        
        guard let action = components.host, action == pathActionOpenScreen else {
            print("Unknown URL, we can't handle this one!")
            return nil
        }
        
        guard let pageName = components.queryItems?.first(where: { $0.name == "page" })?.value else {
            print("Recipe name not found")
            return nil
        }
        
        return pageName.toScreen()
    }
}
