//
//  CardView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 3.05.2022.
//

import SwiftUI

struct CardView: View {

    // MARK: Properties

    private let card: Card
    
    // MARK: Init

    init(
        with card: Card
    ) {
        self.card = card
    }
    
    // MARK: UI

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(card.cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color: Color(UIColor.label), radius: 0.5, x: 0.5, y: -0.5)
                .padding(3)
                
            // Card Deatils
            VStack(alignment: .leading, spacing: 10) {
                
                Text(card.name)
                    .fontWeight(.bold)
                
                Text(card.cardNumber.maskCardNumber())
                    .font(.callout)
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
            .padding()
            .padding(.bottom, 10)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ZStack {
                CardView(
                    with: Card(
                        name: "Ali Mert",
                        cardNumber: "4345 5687 7867 0978",
                        cardImage: "Card1"
                    )
                )
                    .padding(.horizontal)
            }
            .preferredColorScheme(.dark)
        }
    }
}
