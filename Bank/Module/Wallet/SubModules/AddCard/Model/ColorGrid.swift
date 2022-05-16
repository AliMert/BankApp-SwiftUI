//
//  ColorGrid.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 3.05.2022.
//

import SwiftUI

struct ColorGrid: Identifiable {
    static let width: CGFloat = 120
    static let height: CGFloat = 65

    let id = UUID().uuidString
    let hexValue: String
    let color: Color
    
    // MARK: Animation Properties for Each Card
    
    var rotateCards: Bool = false
    var addToGrid: Bool = false
    var showText: Bool = false
    var removeFromView: Bool = false
}
