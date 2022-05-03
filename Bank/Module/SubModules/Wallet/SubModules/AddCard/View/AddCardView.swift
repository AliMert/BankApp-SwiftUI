//
//  AddCardView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 3.05.2022.
//

import SwiftUI

struct AddCardView: View {
    
    // MARK: Animation Properties
    // Instead of making each boolean for separate animation making it as a array to avoid multiple lines of code.
    @State var animations: [Bool] = Array(repeating: false, count: 10)
    
    // MARK: Sample Colors
    @State private var colors: [ColorGrid] = [
        ColorGrid(hexValue: "#15654B", color: Color("Green")),
        ColorGrid(hexValue: "#DAA4FF", color: Color("Violet")),
        ColorGrid(hexValue: "#FFD90A", color: Color("Yellow")),
        ColorGrid(hexValue: "#FE9EC4", color: Color("Pink")),
        ColorGrid(hexValue: "#FB3272", color: Color("Orange")),
        ColorGrid(hexValue: "#4460EE", color: Color("Blue")),
    ]
    
    var body: some View {
        VStack {
           CreditCard()
            
            HStack {
                Text("Choose a color")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .hLeading()
                
                Button {
                    
                } label: {
                    Text("View All")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Pink"))
                        .underline()
                }
            }
            .padding()
            
            Color(UIColor.systemBackground)
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 40))
                .padding(.top)

        }
        .vTop()
        .hCenter()
        .padding(.top, 20)
        .ignoresSafeArea(.container, edges: .bottom)
        .background(Color("Add Card BG"))
        .onAppear(perform: animateScreen)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    print("Profile Photo tapped!")
                } label: {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 35))
                        .tint(Color(UIColor.label))
                }
            }
        }
    }
    
    private func animateScreen() {
        // MARK: Animating Screen
        // First Animation of Credit Card
        // Delaying First Animation after the second Animation
        withAnimation(.interactiveSpring(response: 1.3, dampingFraction: 0.7, blendDuration: 0.7).delay(0.2)){
            animations[0] = true
        }
    }
    
    @ViewBuilder
    private func CreditCard() -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("Pink"))
            
            VStack {
                
                Text("Bank")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 0.5, x: 0.8, y: -0.5)
                    .hLeading()
                
                VStack(spacing: 0) {
                    Text("1111 **** **** 1111")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 0.3, x: 0.5, y: -0.5)
                        .hLeading()
                    
                    HStack(spacing: 8) {
                        
                        VStack(spacing: 0) {
                            
                            Text("VALID")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                            
                            Text("THRU")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                        
                        Text("12/24")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 0.3, x: 0.5, y: -0.5)
                    }
                    .hLeading()
                    .padding(.leading, 30)
                    
                    HStack(spacing: -12) {
                        Text("Ali Mert Ozhayta")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 0.3, x: 0.5, y: -0.5)
                            .hLeading()
                        
                        Circle()
                            .stroke(.white, lineWidth: 1)
                            .frame(width: 30, height: 30)
                        
                        Circle()
                            .stroke(.white, lineWidth: 1)
                            .frame(width: 30, height: 30)
                    }
                }
                .vBottom()
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
            .vTop()
            .hLeading()
            
            // MARK: Top Ring
            
            Circle()
                .stroke(.white.opacity(0.5), lineWidth: 18)
                .offset(x: 130, y: -120)
        }
        .clipped()
        .frame(maxWidth: 325, maxHeight: 200)
        .shadow(color: Color(UIColor.label), radius: 0.5, x: 0.5, y: 0.5)

    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView()
            .preferredColorScheme(.dark)
    }
}
