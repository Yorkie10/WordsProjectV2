//
//  TestProgress.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 07.10.2023.
//

import SwiftUI
import AVFoundation

//struct TestProgress: View {
//    @State private var isPlaying = false
//    @State private var progress: Float = 0.0
//    private let synthesizer = AVSpeechSynthesizer()
//    private var speechUtterance: AVSpeechUtterance?
//
//    var body: some View {
//        VStack {
//            Text("Прогресс озвучиваемого текста:")
//            Slider(value: $progress, in: 0...1)
//                .disabled(!isPlaying)
//                .padding()
//
//            Button(action: {
//                if !isPlaying {
//                    startPlaying()
//                } else {
//                    stopPlaying()
//                }
//            }) {
//                Text(isPlaying ? "Пауза" : "Воспроизвести")
//            }
//        }
//    }
//
//    private  func startPlaying() {
//        isPlaying = true
//        synthesizer.delegate = self
//        let textToSpeak = "Ваш текст для озвучивания здесь"
//        speechUtterance = AVSpeechUtterance(string: textToSpeak)
//        speechUtterance?.rate = 0.5 // Скорость озвучивания, по желанию
//        synthesizer.speak(speechUtterance!)
//    }
//
//    private func stopPlaying() {
//        isPlaying = false
//        synthesizer.stopSpeaking(at: .immediate)
//    }
//}
//
//extension TestProgress: AVSpeechSynthesizerDelegate {
//    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
//        isPlaying = false
//        progress = 1.0
//    }
//
//    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
//        isPlaying = true
//        progress = 0.0
//    }
//
//    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
//        isPlaying = false
//    }
//
//    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
//        isPlaying = true
//    }
//
//    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
//        isPlaying = false
//    }
//}
//

