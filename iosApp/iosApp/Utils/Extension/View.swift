//
//  View.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

extension View {
    func customShadow(color: Color = Color(colorName: .black).opacity(0.1), radius: CGFloat = 2, x: CGFloat = 0, y: CGFloat = 2) -> some View {
        return self.shadow(color: color, radius: radius, x: x, y: y)
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
