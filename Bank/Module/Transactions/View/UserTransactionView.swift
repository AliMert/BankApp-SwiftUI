//
//  UserTransactionView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 10.05.2022.
//

import SwiftUI

struct UserTransactionView: View {
    private var user: User
    private var index: Int
    @State private var animateView: Bool = false
    private let maxVisibleIndex = 8

    init(user: User, index: Int) {
        self.user = user
        self.index = index
    }

    var body: some View {

        HStack(spacing: 12) {
            Image(user.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 8) {
                Text(user.name)
                    .fontWeight(.bold)

                Text(user.type)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)

            Text(user.amount)
                .font(.title3.bold())
                .foregroundColor(user.color)
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background{
            RoundedRectangle(cornerRadius: 35, style: .continuous)
                .stroke(.gray.opacity(0.2),lineWidth: 1)
        }
        .offset(y: index > maxVisibleIndex ? 0 : animateView ? 0 : 650)
        .onAppear {
            if index > maxVisibleIndex { return }

            withAnimation(.easeInOut(duration: 0.8).delay(Double(index) * 0.1)) {
                animateView = true
            }
        }
    }
}

struct UserTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        UserTransactionView(user: User(name: "Ali Mert", image: "user1", type: "Sent", amount: "-$120", color: .red), index: 0)
    }
}
