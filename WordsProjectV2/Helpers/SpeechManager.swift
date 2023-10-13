//
//  SpeechManager.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 04.10.2023.
//

import AVFoundation
import SwiftUI


final class SpeechService: NSObject, ObservableObject {
    
    @Published var isSpeaking = false
    
    private lazy var synthesizer: AVSpeechSynthesizer = {
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.delegate = self
        return synthesizer
    }()
    private var startTime: Date?
    private var endTime: Date?
    
    var currentTime: TimeInterval = 0
    var duration: TimeInterval = 0
    var speaking: Bool {
        synthesizer.isSpeaking
    }
    
    func continueSpeaking() {
        synthesizer.continueSpeaking()
    }
    
    func pauseSpeakingImmediatly() {
        synthesizer.pauseSpeaking(at: .immediate)
    }
    
    func say(_ phrase: String?) {
        if let phrase {
            let speechUtterance = AVSpeechUtterance(string: phrase)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            
            // Estimate the duration based on the number of words (adjust the value as needed)
            let wordsPerMinute: Double = 150.0 // Adjust this value as needed
            let totalWords = phrase.split(separator: " ").count
            let estimatedDuration = Double(totalWords) / wordsPerMinute * 60.0
            
            synthesizer.speak(speechUtterance)
            duration = estimatedDuration
        }
    }
    
    // Метод для обновления текущего времени
    func updateCurrentTime() -> TimeInterval {
        if isSpeaking, let startTime = startTime {
            currentTime = Date().timeIntervalSince(startTime)
        } else {
            currentTime = 0
        }

        return currentTime
    }
}


extension SpeechService: AVSpeechSynthesizerDelegate {
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        isSpeaking = true
        startTime = Date()
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        isSpeaking = false
    }
}
