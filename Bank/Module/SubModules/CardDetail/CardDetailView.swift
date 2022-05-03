//
//  CardDetailView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 3.05.2022.
//

import SwiftUI

struct CardDetailView: View {
    var currentCard: Card
    @Binding var showDetail: Bool
    
    // Matched Geometry Effect
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack {
            CardView(with: currentCard)
                .matchedGeometryEffect(id: currentCard.id, in: animation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
