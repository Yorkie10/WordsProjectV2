//
//  WordAndExplanation.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 04.10.2023.
//

import Foundation


struct WordAndExplanation: Identifiable {
    let id = UUID()
    var word: String
    var explanation: String
    var isFavorite: Bool = false
}

var words: [WordAndExplanation] = [
    WordAndExplanation(word: "Gay lord",
                       explanation: "Used as a disparaging term for a gay man. Used as a disparaging term for a foolish or inept man or boy. An American surname​."),
    WordAndExplanation(word: "Abuse",
                       explanation: "use something to bad effect or for a bad purpose"),
    WordAndExplanation(word: "Fabricate",
                       explanation: "an invention of untrue facts to a story or situation. "),
    WordAndExplanation(word: "Feasible",
                       explanation: "an activity that is possible"),
    WordAndExplanation(word: "Feat",
                       explanation: "an activity that requires great strength, skill, and courage."),
    WordAndExplanation(word: "Feeble",
                       explanation: "a person or statement that is unconvincing and weak. "),
    WordAndExplanation(word: "Fixation",
                       explanation: "An obsession over something or someone."),
    WordAndExplanation(word: "Generic",
                       explanation: "a group or class that does not have a brand name. "),
    WordAndExplanation(word: "Gimmick",
                       explanation: "a device or trick delivered to attract attention."),
    WordAndExplanation(word: "Graffiti",
                       explanation: "Drawings or writings on a surface in public.")]
