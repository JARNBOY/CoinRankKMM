//
//  String.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import Foundation

extension String {
    func toMarketCapFormat() -> String {
        guard let number = Double(self) else { return self }
        let million = number / 1000000
        let billion = number / 1000000000
        let trillion = number / 1000000000000
        
        if trillion >= 1.0 {
            return "\(trillion.toDecimalString()) trillion"
        } else if billion >= 1.0 {
            return "\(billion.toDecimalString()) billion"
        } else if million >= 1.0 {
            return "\(million.toDecimalString()) million"
        } else {
            return self.toDecimalString()
        }
    }

    func toDecimalString(_ countDecimal: Int = 2) -> String {
        var str = ""
        let num = Double(self) ?? 0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = false

        // Rounding down drops the extra digits without rounding.
        numberFormatter.roundingMode = .down
        numberFormatter.minimumFractionDigits = countDecimal
        numberFormatter.maximumFractionDigits = countDecimal
        let number = NSNumber(value:num)

        if let stringFronmNumber = numberFormatter.string(from:number){
            str = stringFronmNumber
        }
        
        return str
    }

    var html2String: String {
        return html2AttributedString?.string ?? ""
    }

    var html2AttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
}
