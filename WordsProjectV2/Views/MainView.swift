//
//  MainView.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 04.10.2023.
//

import SwiftUI
import AVFoundation


struct MainView: View {

    var body: some View {
        ZStack {
            ScrollView {
                cardView
            }
            .background(
                Image("main_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            )
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
        }
    }
    
    var cardView: some View {
        TabView {
            ForEach(words) { word in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    CardView(word: word)
                        .padding(.vertical, 40)
                        .rotation3DEffect(
                            .degrees(minX / -10),
                            axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40 ))
                    
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
