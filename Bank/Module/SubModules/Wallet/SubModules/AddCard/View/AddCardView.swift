//
//  AddCardView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 3.05.2022.
//

import SwiftUI

struct AddCardView: View {

    private struct AnimationType {
        var creditCard = false
        var viewAllButton = false
        var bottomView = false
        var coloredCard = false
    }

    // MARK: Animation Properties
    // Instead of making each boolean for separate animation making it as a struct to avoid multiple lines of code. Array not prefered cause instead of using index 'animations[0]', accessing element with description is easy to write and understand 'animations.creditCard'
    @State private var animations = AnimationType()
    @Namespace private var animation: Namespace.ID
    @State var selectedColor: Color = Color("Blue")

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

            GeometryReader { proxy in

                let maxY = proxy.frame(in: .global).maxY

                CreditCardView(color: $selectedColor)
                    .hCenter()
                    //MARK: 3D Rotation
                    .rotation3DEffect(.init(degrees: animations.creditCard ? 0 : -270), axis: (x: 1, y: 0.001, z: 0.001), anchor: .center) // '0.001' for Xcode debug logs
                    .offset(y: animations.creditCard ? 0 : maxY)
            }
            .frame(maxHeight: 200)
            .padding(.vertical)

            HStack {
                Text("Choose a color")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .hLeading()
                    .offset(x: animations.viewAllButton ? 0 : -200)
                
                Button {
                    
                } label: {
                    Text("View All")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Pink"))
                        .underline()
                        .offset(x: animations.viewAllButton ? 0 : 200)
                }
            }
            .padding()

            GeometryReader { geometry in

                ZStack {

                    Color("Add Card BG")
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 40))
                        .frame(height: animations.bottomView ? nil : 0)
                        .shadow(color: Color(UIColor.label).opacity(0.5), radius: 0.3, x: 0.1, y: -0.1)
                        .vBottom()

                    ZStack {

                        // MARK: Initial Grid View
                        ForEach(colors) { colorGrid in

                            // Hiding the source ones
                            if !colorGrid.removeFromView {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(colorGrid.color)
                                    .frame(width: ColorGrid.width, height: animations.coloredCard ? ColorGrid.height : 100)
                                    // MARK: Rotation Effect
                                    .rotationEffect(.init(degrees: colorGrid.rotateCards ? 180: 0))
                                .matchedGeometryEffect(id: colorGrid.id, in: animation)
                            }
                        }
                    }
                    // MARK: Applying Opacity with Scale Animation
                    // To Avoid this Creating a BG Overlay and hiding it
                    // So that it will look like the whole stack is Applying Opacity Animation
                    .overlay {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color("Add Card BG"))
                            .frame(width: ColorGrid.width, height: animations.coloredCard ? ColorGrid.height : 100)
                            .opacity(animations.coloredCard ? 0 : 1)
                    }
                    .scaleEffect(animations.coloredCard ? 1 : 2.3)
                }
                .hCenter()
                .vCenter()

                // MARK: ScrollView  with Color Grids
                ScrollView(.vertical, showsIndicators: false) {

                    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)

                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(colors) { colorGrid in
                            ColorGridCardView(
                                colorGrid: colorGrid,
                                selectedColor: $selectedColor,
                                colors: $colors,
                                animation: animation
                            )
                        }
                    }
                    .padding([.horizontal, .top], 40)
                }
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 40))
            }
            .padding(.top)
        }
        .vTop()
        .hCenter()
        .padding(.top, 20)
        .ignoresSafeArea(.container, edges: .bottom)
        .background(Color(UIColor.systemBackground))
        .onAppear(perform: animateScreen)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    print("Profile Photo tapped!")
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .aspectRatio(contentMode: .fit)
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
            animations.creditCard = true
        }

        // Second Animating the Hstack with View All Button
        withAnimation(.easeInOut(duration: 0.7)) {
            animations.viewAllButton = true
        }

        // Third Animation Making The Bottom to Slide up eventually
        withAnimation(.interactiveSpring(response: 1.3, dampingFraction: 0.7, blendDuration: 0.7).delay(0.2)){
            animations.bottomView = true
        }

        // Fourth Animation Applying Opacity with scale animation for Stack Grid Colors
        withAnimation(.easeInOut(duration: 0.8)) {
            animations.coloredCard = true
        }

        // Final Grid Forming Animation
        for (index, reversedIndex) in zip(colors.indices, colors.indices.reversed()) {

            // Animating after the opacity animation has Finished its job
            // Rotating One card another with a time delay of 0.1sec
            let delay: Double = (0.9 + (Double(index) * 0.1))

            // Last card is rotating first since we're putting in ZStack
            // So we need to start rotating from the last element
            // To do that use index from back -> reversed Index
            withAnimation(.easeInOut.delay(delay)) {
                colors[reversedIndex].rotateCards = true
            }

            // After rotation adding it to grid view one after another
            // Since 'withAnimation' does not have a completion handler yet
            // By using DispathcQueue wait till animation overs
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation {
                    colors[reversedIndex].addToGrid = true
                }
            }
        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddCardView()
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.dark)
    }
}
