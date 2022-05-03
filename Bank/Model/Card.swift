//
//  Card.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 2.05.2022.
//

import struct SwiftUI.UUID

struct Card: Identifiable {
    var id = UUID().uuidString
    var name: String
    var cardNumber: String
    var cardImage: String
}


