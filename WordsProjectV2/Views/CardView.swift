//
//  CardView.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 04.10.2023.
//

import SwiftUI


struct CardView: View {
    @StateObject private var speechService = SpeechService()
    @StateObject private var favoriteManager = FavoritesManager()
    @State private var width: CGFloat = 0
    @State private var isFavorite: Bool = false


    @State var word: WordAndExplanation = words[0]
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text(word.word.uppercased())
                .fontWeight(.bold)
                .lineLimit(10)
                .foregroundStyle(.linearGradient(colors: [.green, .black], startPoint: .topLeading, endPoint: .bottomLeading))
            Text(word.explanation)
                .font(.subheadline)
                .fontWeight(.regular)
                .lineLimit(10)
                .frame(maxWidth: .infinity, alignment: .center)
            HStack {
                Button {
                    speechService.isSpeaking.toggle()
                    playPauseTapped(textToSpeak: word.explanation)
           
                } label: {
                    Text(speechService.isSpeaking ? "pause" : "play")
                    
                }
                ZStack (alignment: .leading) {
                    Capsule().fill(Color.black.opacity(0.08)).frame(height: 8)
                    
                    Capsule().fill(Color.red).frame(width: width, height: 8)
                }
            }
            
            Button {
                isFavorite.toggle()
                word.isFavorite = isFavorite
                if isFavorite {
                    favoriteManager.addFavorite(word: word)
                } else {
                    favoriteManager.removeFavorite(word.word)
                }
               
            } label: {
                Image("ic_add_to_favorites")
                    .renderingMode(.template)
                    .foregroundColor(word.isFavorite ? .red : .white)
        
            }
        }
        .padding(.all, 20)
        .padding(.vertical, 20)
        .frame(height: 350)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
        .padding(.horizontal, 20)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if speechService.isSpeaking {
                    let screen = UIScreen.main.bounds.width
                    let value = speechService.updateCurrentTime() / speechService.duration
                    width = screen * CGFloat(value)
                }
            }
        }
    }
    
    func playPauseTapped(textToSpeak: String?) {
        if speechService.isSpeaking && !speechService.speaking {
            speechService.say(textToSpeak)
        } else if !speechService.isSpeaking && speechService.speaking {
            speechService.pauseSpeakingImmediatly()
        } else {
            speechService.continueSpeaking()
        }
    }
}

#Preview {
    CardView()
}
