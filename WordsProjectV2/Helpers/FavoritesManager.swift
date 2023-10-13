//
//  FavoritesManager.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 04.10.2023.
//

import Foundation


final class FavoritesManager: ObservableObject {
    
    private let favoriteKey = "favoriteWords"
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let userDefaults = UserDefaults.standard
    
    @Published var favoriteWords: [FavoriteWord] = []

    
    init() {
        self.favoriteWords = getSavedData()
    }
    
    private func getSavedData() -> [FavoriteWord] {
        if let savedFavorites = userDefaults.data(forKey: favoriteKey) {
            if let loadedFavorites = try? decoder.decode([FavoriteWord].self, from: savedFavorites) {
                return loadedFavorites
            }
        }
        return []
    }
    
    private func saveWords(_ words: [FavoriteWord]) {
        if let encoded = try? encoder.encode(words) {
            userDefaults.set(encoded, forKey: favoriteKey)
        }
    }
    
    func addFavorite(word: WordAndExplanation) {
        let favorite = FavoriteWord(word: word.word, explanation: word.explanation)
        if !favoriteWords.contains(where: { $0.word == favorite.word }) {
             favoriteWords.append(favorite)
        } else {
            if let index = favoriteWords.firstIndex(where: { $0.word == favorite.word }) {
                favoriteWords.remove(at: index)
            }
        }
        saveWords(favoriteWords)
//        let favorite = FavoriteWord(word: word.word, explanation: word.explanation)
//        var savedWords = getSavedData()
//        savedWords.append(favorite)
//        saveWords(savedWords)
    }
    
    func removeFavorite(_ favorite: String) {
        favoriteWords = getSavedData()
        if let index = favoriteWords.firstIndex(where: { $0.word == favorite }) {
            favoriteWords.remove(at: index)
            saveWords(favoriteWords)
        }
        
        if let idx = words.firstIndex(where: { $0.word == favorite }) {
            words[idx].isFavorite.toggle()
        }
    }
    
    func expandExplanation(_ favorite: String) {
        if let index = favoriteWords.firstIndex(where: { $0.word == favorite }) {
            favoriteWords[index].expanded.toggle()
        }
    }
}
