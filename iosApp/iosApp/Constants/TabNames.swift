//
//  TabNameConstant.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

enum PageTab: String {
    case homeTab = "homeTab"
    case centerTab = ""
    case profileTab = "profileTab"
    
    var indexTab: IndexPageTab {
        switch self {
        case .homeTab:
            IndexPageTab.indexHomeTab
        case .centerTab:
            IndexPageTab.indexCenterTab
        case .profileTab:
            IndexPageTab.indexProfileTab
        }
    }
    
    var icTab: IconPageTab {
        switch self {
        case .homeTab:
            IconPageTab.icHomeTab
        case .centerTab:
            IconPageTab.icCenterTab
        case .profileTab:
            IconPageTab.icProfileTab
        }
    }
}

enum IconPageTab: String {
    case icHomeTab = "house.circle"
    case icCenterTab = "plus.circle.fill"
    case icProfileTab = "person.crop.circle"
}

enum IndexPageTab: Int {
    case indexHomeTab = 0
    case indexCenterTab = 1
    case indexProfileTab = 2
}
