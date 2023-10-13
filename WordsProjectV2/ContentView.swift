//
//  ContentView.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 04.10.2023.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .main
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .main:           MainView()
                case .favorities:     FavoritesView()
                case .notifications:  FavoritesView()
                case .library:        FavoritesView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            TabBar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

#Preview {
    ContentView()
}
