//
//  FavoriteWord.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 04.10.2023.
//

import Foundation


struct FavoriteWord: Identifiable, Codable {
    let id = UUID()
    var word: String
    var explanation: String
    var expanded = false 
}
