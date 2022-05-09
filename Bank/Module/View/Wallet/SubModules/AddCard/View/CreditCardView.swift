//
//  CreditCardView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 4.05.2022.
//

import SwiftUI

struct CreditCardView: View {

    @Binding private var color: Color

    init(color: Binding<Color> = .constant(Color("Blue"))) {
        self._color = color
    }

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(color)
            
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

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView()
    }
}
