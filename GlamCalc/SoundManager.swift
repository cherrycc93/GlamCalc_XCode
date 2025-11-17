//
//  SoundManager.swift
//  GlamCalc
//
//  Singleton manager that handles audio playback for button clicks and other
//  sound effects. Uses system sounds via AudioServicesPlaySystemSound for
//  lightweight, consistent audio feedback.
//

import AVFoundation
import UIKit

class SoundManager {
    static let shared = SoundManager()
    
    private var audioPlayer: AVAudioPlayer?
    
    private init() {
        // Configure audio session
        configureAudioSession()
    }
    
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to configure audio session: \(error)")
        }
    }
    
    // Play a click sound
    func playClickSound() {
        guard SettingsManager.shared.soundEnabled else { return }
        
        // Use system keyboard click sound (ID: 1104)
        AudioServicesPlaySystemSound(1104)
    }
    
    // Alternative: play a custom sound effect
    func playCustomClickSound() {
        guard SettingsManager.shared.soundEnabled else { return }
        
        // Use a different system sound - peek sound (ID: 1519)
        AudioServicesPlaySystemSound(1519)
    }
}
