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
    
    var body: some View {
        
        VStack {
            CardView(with: currentCard)
                .matchedGeometryEffect(id: currentCard.id, in: animation)
                .padding(.horizontal)
                .onTapGesture {
                    // Closing Expenses View First
                    withAnimation(.easeInOut) {
                        showExpenseView = false
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            self.showDetailCard = false
                        }
                    }
                }
            
            GeometryReader { geometry in
                let height = geometry.size.height + 50
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                    
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background(
                    Color.white.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .ignoresSafeArea()
                )
                .padding([.horizontal, .top])
                .offset(y: showExpenseView ? .zero : height)
            }
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("BG").ignoresSafeArea()
        )
        .onAppear {
            withAnimation(.easeOut.delay(0.1)) {
                showExpenseView = true
            }
        }
    }
}

//struct CardDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardDetailView(
//            currentCard: cards[0],
//            showDetail: .constant(true),
//            animation: Namespace.ID
//        )
//    }
//}
