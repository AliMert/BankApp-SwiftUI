//
//  HomeView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 2.05.2022.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: Animation Properties
    @State var expandCards: Bool = false

    private var cards: [Card] = [
        Card(name: "Ali Mert", cardNumber: "4345 5687 7867 0978", cardImage: "Card1"),
        Card(name: "Jenna", cardNumber: "5687 4345 7867 5687", cardImage: "Card2"),
        Card(name: "Jessica", cardNumber: "7867 4345 5687 7867", cardImage: "Card3"),
//        Card(name: "Ali Mert", cardNumber: "4345 5687 7867 0978", cardImage: "Card1"),
//        Card(name: "Jenna", cardNumber: "5687 4345 7867 5687", cardImage: "Card2"),
//        Card(name: "Jessica", cardNumber: "7867 4345 5687 7867", cardImage: "Card3"),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: expandCards ? .leading : .center)
                .overlay(alignment: .trailing) {
                    
                    // MARK: Close Button
                    Button {
                        // Closing Cards
                        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
                            expandCards = false
                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue, in: Circle())
//                            .shadow(color: Color(UIColor.label), radius: 0.5, x: 0.5, y: 0.5)

                    }
                    .rotationEffect(.init(degrees: expandCards ? 45 : .zero))
                    .offset(x: expandCards ? 10 : 15)
                    .opacity(expandCards ? 1 : 0)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: .zero) {
                    
                    // MARK: Cards
                    ForEach(cards.indices) { index in
                        CardView(with: cards[index], at: index)
                    }
                }
                .padding(.top, expandCards ? 30 : 0)
                .overlay {
                    // To avoid scrolling
                    Rectangle()
                        .fill(.black.opacity(expandCards ? 0 : 0.01))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                expandCards = true
                            }
                        }
                }
            }
            .coordinateSpace(name: "SCROLL")
            .offset(y: expandCards ? 0 : 30)
            
            // MARK: Add Button
            Button {
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.blue, in: Circle())
            }
            .rotationEffect(.init(degrees: expandCards ? 180 : .zero))
            .scaleEffect(expandCards ? 0 : 1)
            .opacity(expandCards ? 0 : 1)
            .frame(height: expandCards ? 0 : nil)
            .padding(.bottom, expandCards ? 0 : 30)
        }
        .padding([.horizontal, .top])
    }
    
    // MARK: Card View
    @ViewBuilder
    func CardView(with card: Card, at index: Int) -> some View {
        
        GeometryReader { geometry in
           
            let rect = geometry.frame(in: .named("SCROLL"))
            // display some portion of each Card
            let offset =  CGFloat(index) * (expandCards ? 10 : 70)
            
            ZStack(alignment: .bottomLeading) {
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: Color(UIColor.label), radius: 0.5, x: 0.5, y: -0.5)
                    .padding([.top], 5)
                    
                // Card Deatils
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(card.name)
                        .fontWeight(.bold)
                    
                    Text(maskedCardNumber(number: card.cardNumber))
                        .font(.callout)
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
                .padding()
                .padding(.bottom, 10)
            }
            .hCenter()
            // Making it as a Stack
            .offset(y: expandCards ? offset : -rect.minY + offset)
        }
        .padding(.bottom, 10)
        .frame(height: 205)
    }
    
    // MARK: Hiding all Numbers except last four
    func maskedCardNumber(number: String) -> String {
        var newValue = ""
        let maxCount = number.count - 4
        
        number.enumerated().forEach { value in
            if 4 > value.offset || value.offset >= maxCount {
                // Displaying Text
                let string = String(value.element)
                newValue.append(contentsOf: string)
            } else {
                // Simply Displaying Star and Avoid Space
                let character = String(value.element)
                newValue.append(character == " " ? character : "*")
            }
        }
        return newValue
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        HomeView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
