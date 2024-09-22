//
//  Double.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import Foundation

extension Double {
    func toDecimalString(_ countDecimal: Int = 2) -> String {
        return "\(self)".toDecimalString(countDecimal)
    }
    
    func toMarketCapFormat() -> String {
        let number = self
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
}
