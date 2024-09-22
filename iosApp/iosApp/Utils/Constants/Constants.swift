//
//  Constants.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    static var bundle: Bundle {
        return Bundle.main
    }
    
    static func openURLWeb(url: String) {
        if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

var bounds = UIScreen.main.bounds
var widthDevice = bounds.size.width
var heightDevice = bounds.size.height
