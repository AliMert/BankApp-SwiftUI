//
//  User.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 9.05.2022.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID().uuidString
    let name: String
    let image: String
    let type: String
    let amount: String
    let color: Color
}
