//
//  CustomCorner.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 4.05.2022.
//

import SwiftUI

struct CustomCorner: Shape {
    let corners: UIRectCorner
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
