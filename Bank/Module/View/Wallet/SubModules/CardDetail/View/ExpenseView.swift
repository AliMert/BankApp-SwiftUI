//
//  ExpenseView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 3.05.2022.
//

import SwiftUI

struct ExpenseView: View {
    let expense: Expense
    let index: Int
    let isLastIndex: Bool

    // Displaying Expenses one by one based on Index -> for animation
    @State private var showView: Bool = false
    
    init(
        expense: Expense,
        index: Int,
        isLastIndex: Bool = false
    ) {
        self.expense = expense
        self.index = index
        self.isLastIndex = isLastIndex
    }
    
    var body: some View {
        VStack {
        HStack(spacing: 14) {
            Image(expense.productIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(expense.product)
                    .fontWeight(.bold)
            
                Text(expense.spendType)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(expense.amountSpent)
                    .fontWeight(.bold)
            
                Text(Date().formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
            Divider()
                .opacity(showView ? isLastIndex ? 0 : 1 : 0)
        }
        .opacity(showView ? 1 : 0)
        .onAppear {
            // taken time to show up
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeInOut(duration: 0.3).delay(Double(index) * 0.1)) {
                    showView = true
                }
            }
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static private let expense = Expense(amountSpent: "$55", product: "Netflix", productIcon: "Netflix", spendType: "Movies")

    static var previews: some View {
        ExpenseView(expense: expense, index: 0)
            .preferredColorScheme(.dark)
    }
}
