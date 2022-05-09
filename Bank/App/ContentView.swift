//
//  ContentView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 2.05.2022.
//

import SwiftUI

struct ContentView: View {
    init() {
        // Fixes a 'SwiftUI 3.0' bug that makes the divider between the tab Bar and the View invisible
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
    }
    var body: some View {
        
        TabView {
            // MARK: Tab 1 - Debt
            DebtView()
            .tabItem {
                Label {
                    Text("Debt")
                } icon: {
                    Image("debt icon")
                        .renderingMode(.template)
                }
            }

            // MARK: Tab 2 - Wallet
                NavigationView {
                    WalletView()
                        .navigationBarHidden(true)

                }
                .navigationViewStyle(.stack)
                .accentColor(Color(UIColor.label))
            .tabItem {
                Label("Wallet", systemImage: "creditcard")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
