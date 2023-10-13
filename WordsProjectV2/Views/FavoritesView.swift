//
//  FavoritesView.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 04.10.2023.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var favoritesManager = FavoritesManager()
    @Namespace var namespace
    @State var show = false
   
    var body: some View {
        Color.red
            .ignoresSafeArea()
        expandbleView
    }
    
    var expandbleView: some View {
        ScrollView {
            ForEach(favoritesManager.favoriteWords) { fav in
                VStack(alignment: .leading) {
                    HStack() {
                        Text(fav.word)
                        Spacer()
                        HStack(spacing: 8) {
                            Button("Explanation") {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                    favoritesManager.expandExplanation(fav.word)
                                   // show.toggle()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .buttonStyle(.bordered)
                            Button {
                                favoritesManager.removeFavorite(fav.word)
                                // Обновление состояния isFavorite в CardView
                                if let index = words.firstIndex(where: { $0.id == fav.id }) {
                                    words[index].isFavorite = false
                                }
                            } label: {
                                Image("ic_add_to_favorites")
                                    .renderingMode(.template)
                            }
                        }
                    }
                    if fav.expanded {
                        Text(fav.explanation)
                            .font(.footnote.weight(.semibold))
                            .matchedGeometryEffect(id: fav.id, in: namespace)
                    }
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
        }
    }
}


struct CollapsExpandableView: View {
    var favorite: FavoriteWord
    var namespace: Namespace.ID
    @State var show = false
    @ObservedObject var favoritesManager: FavoritesManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(favorite.word)
                    .font(.largeTitle.weight(.bold))
                Spacer()
                Button("Expand") {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        show.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Remove") {
                    favoritesManager.removeFavorite(favorite.word)
                }
            }
       
            
            if show {
                Text(favorite.explanation.uppercased())
                    .font(.footnote.weight(.semibold))
            }
        }
        .padding(20)
        .background(
            Image("Illustration 9")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .background(
            Image("Background 5")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .cornerRadius(show ? 30 : 0) // Применяем скругление, когда показано
    }
}
    

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
