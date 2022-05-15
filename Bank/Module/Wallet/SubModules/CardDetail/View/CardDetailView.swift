//
//  CardDetailView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 3.05.2022.
//

import SwiftUI

struct CardDetailView: View {
    var currentCard: Card
    @Binding var showDetailCard: Bool

    // Matched Geometry Effect
    var animation: Namespace.ID
    
    // Delaying Expenses View
    @State private var showExpenseView: Bool = false
    
    
    private let expenses: [Expense] = [
        Expense(amountSpent: "$128", product: "Amazon", productIcon: "Amazon", spendType: "Groceries"),
        Expense(amountSpent: "$18", product: "Youtube", productIcon: "Youtube", spendType: "Streaming"),
        Expense(amountSpent: "$10", product: "Dribbble", productIcon: "Dribbble", spendType: "Membership"),
        Expense(amountSpent: "$28", product: "Apple", productIcon: "Apple", spendType: "Apple Pay"),
        Expense(amountSpent: "$9", product: "Patreon", productIcon: "Patreon", spendType: "Membership"),
        Expense(amountSpent: "$100", product: "Instagram", productIcon: "Instagram", spendType: "Ad Publish"),
        Expense(amountSpent: "$55", product: "Netflix", productIcon: "Netflix", spendType: "Movies"),
        Expense(amountSpent: "$348", product: "Photoshop", productIcon: "Photoshop", spendType: "Editing"),
        Expense(amountSpent: "$99", product: "Figma", productIcon: "Figma", spendType: "Pro Member")
    ]

    var body: some View {
        
        VStack {
            CardView(with: currentCard)
                .matchedGeometryEffect(id: currentCard.id, in: animation)
                .frame(height: 200)
                .onTapGesture {
                    // Closing Expenses View First
                    withAnimation(.easeInOut) {
                        showExpenseView.toggle()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            self.showDetailCard.toggle()
                        }
                    }
                }
                .zIndex(10)
            
            GeometryReader { geometry in
                let height = geometry.size.height + 50
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                        
                        // Expenses
                        ForEach(expenses.indices, id: \.self) { index in
                            ExpenseView(
                                expense: expenses[index],
                                index: index,
                                isLastIndex: index == expenses.count - 1
                            )
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background {
                    Color(UIColor.systemBackground)
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 25))
                }
                .offset(y: showExpenseView ? .zero : height)
            }
            .padding([.horizontal, .top])
            .zIndex(-10)
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("Wallet Detail BG").ignoresSafeArea()
        )
        .onAppear {
            withAnimation(.easeOut.delay(0.1)) {
                showExpenseView = true
            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        CardDetailView(
            currentCard: Card(name: "Ali Mert", cardNumber: "4345 5687 7867 0978", cardImage: "Card1"),
            showDetailCard: .constant(true),
            animation: animation
        )
    }
}
