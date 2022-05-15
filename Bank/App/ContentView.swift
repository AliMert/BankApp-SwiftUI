//
//  ContentView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 2.05.2022.
//

import SwiftUI
import HidableTabView

struct ContentView: View {
    init() {
        // Fixes a 'SwiftUI 3.0' bug that makes the divider between the tab Bar and the View invisible
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
    }
    
    var body: some View {
        
        TabView {
            // MARK: Tab 1 - Transactions
            TransactionsView()
                .tabItem {
                    Label {
                        Text("Transactions")
                    } icon: {
                        Image("debt tab item")
                            .renderingMode(.template)
                    }
                }

            // MARK: Tab 2 - Wallet
            NavigationView {
                WalletView()
                    .onAppear {
                        UITabBar.showTabBar()
                    }
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(.stack)
            .accentColor(Color(UIColor.label))
            .tabItem {
                Label("Wallet", systemImage: "creditcard")
            }
        }
        .hideTabBar(animated: false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
