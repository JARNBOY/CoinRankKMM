//
//  Fonts.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import Foundation
import CoreText
import UIKit
import SwiftUI

class CoinFont {
    enum Style: CaseIterable {
        case robotoBlack
        case robotoBlackItalic
        case robotoBold
        case robotoBoldItalic
        case robotoItalic
        case robotoLight
        case robotoLightItalic
        case robotoMedium
        case robotoMediumItalic
        case robotoRegular
        case robotoThin
        case robotoThinItalic

        var value: String {
            switch self {
            case .robotoBlack:
                return "Roboto-Black.ttf"
            case .robotoBlackItalic:
                return "Roboto-BlackItalic.ttf"
            case .robotoBold:
                return "Roboto-Bold.ttf"
            case .robotoBoldItalic:
                return "Roboto-BoldItalic.ttf"
            case .robotoItalic:
                return "Roboto-Italic.ttf"
            case .robotoLight:
                return "Roboto-Light.ttf"
            case .robotoLightItalic:
                return "Roboto-LightItalic.ttf"
            case .robotoMedium:
                return "Roboto-Medium.ttf"
            case .robotoMediumItalic:
                return "Roboto-MediumItalic.ttf"
            case .robotoRegular:
                return "Roboto-Regular.ttf"
            case .robotoThin:
                return "Roboto-Thin.ttf"
            case .robotoThinItalic:
                return "Roboto-ThinItalic.ttf"
            }
        }

        func swiftUIFont(_ size: CGFloat = 14.0) -> Font {
            return Font(font(size: size))
        }

        func font(size: CGFloat = 14.0) -> UIFont {
            if self.value.contains(".ttf") {
                return customFont(size: size)
            } else {
                return systemFont(size: size)
            }
        }

        private func customFont(size: CGFloat) -> UIFont {
            let fontName = fontNameForTTFFile()
            return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
        }

        func fontNameForTTFFile() -> String {
            switch self.value {
            case "Roboto-Black.ttf":
                return "Roboto-Black"
            case "Roboto-BlackItalic.ttf":
                return "Roboto-BlackItalic"
            case "Roboto-Bold.ttf":
                return "Roboto-Bold"
            case "Roboto-BoldItalic.ttf":
                return "Roboto-BoldItalic"
            case "Roboto-Italic.ttf":
                return "Roboto-Italic"
            case "Roboto-Light.ttf":
                return "Roboto-Light"
            case "Roboto-LightItalic.ttf":
                return "Roboto-LightItalic"
            case "Roboto-Medium.ttf":
                return "Roboto-Medium"
            case "Roboto-MediumItalic.ttf":
                return "Roboto-MediumItalic"
            case "Roboto-Regular.ttf":
                return "Roboto-Regular"
            case "Roboto-Thin.ttf":
                return "Roboto-Thin"
            case "Roboto-ThinItalic.ttf":
                return "Roboto-ThinItalic"
            default:
                return ""
            }
        }

        private func systemFont(size: CGFloat) -> UIFont {
            return UIFont(name: self.value, size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
}
