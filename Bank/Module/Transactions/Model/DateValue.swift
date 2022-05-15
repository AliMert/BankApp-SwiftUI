//
//  DateValue.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 9.05.2022.
//

import Foundation

struct DateValue: Identifiable {
    let id = UUID().uuidString
    let day: Int
    let date: Date
}
