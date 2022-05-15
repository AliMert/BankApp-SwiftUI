//
//  Expense.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 3.05.2022.
//

import SwiftUI

struct Expense: Identifiable {
    let id = UUID().uuidString
    let amountSpent: String
    let product: String
    let productIcon: String
    let spendType: String
}
