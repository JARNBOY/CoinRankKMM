//
//  Image.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

enum ImageNames: String {
    // MARK: - Home
    case searchIcon = "search_icon"
    case deleteSearchIcon = "delete_search_icon"
    case arrowUpIcon = "arrow_up_green_icon"
    case arrowDownIcon = "arrow_down_red_icon"
    case closeIcon = "close_icon"
    case loadingIcon = "loading_icon"
    case pullToRefreshIcon = "pull_to_refresh"
    case giftIcon = "gift_icon"
}

extension Image {
    /// Convenience initializer to create an `Image` instance from an `ImageNames` enumeration.
    /// Uses the raw value of the enumeration case as the image name and a specific bundle.
    init(with imageName: ImageNames) {
        self.init(imageName.rawValue, bundle: Constants.bundle)
    }
}
