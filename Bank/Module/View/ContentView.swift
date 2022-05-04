//
//  ContentView.swift
//  Bank
//
//  Created by Ali Mert Özhayta on 2.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            WalletView()
                .navigationBarHidden(true)

        }
        .navigationViewStyle(.stack)
        .accentColor(Color(UIColor.label))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
