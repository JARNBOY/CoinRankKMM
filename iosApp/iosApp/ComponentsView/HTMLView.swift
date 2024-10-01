//
//  HTMLView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 1/10/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI
import WebKit

struct HTMLView: UIViewRepresentable {
    let descHTMLString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let htmlString =  """
                    <html>
                        <head>
                            <meta name="viewport" content="width=device-width, user-scalable=no"/>
                            <style type="text/css">
                                body {
                                font-family: '\(String(describing: CoinFont.Style.robotoThin.fontNameForTTFFile))' !important;
                                font-color: "\(ColorNames.topCoinNameGrayText.rawValue)" !important;
                                font-size: 14px !important;
                                line-height: 16px !important;
                                }
                            }
                            </style>
                        </head>
                    <body>\(descHTMLString.html2String)</body>
                    </html>
                    """
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}
