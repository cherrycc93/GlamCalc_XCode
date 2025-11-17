//
//  SettingsManager.swift
//  GlamCalc
//
//  Created by Claude
//

import Foundation
import Combine

class SettingsManager: ObservableObject {
    // Published properties that views can observe
    @Published var soundEnabled: Bool {
        didSet {
            UserDefaults.standard.set(soundEnabled, forKey: "soundEnabled")
        }
    }
    
    @Published var hapticsEnabled: Bool {
        didSet {
            UserDefaults.standard.set(hapticsEnabled, forKey: "hapticsEnabled")
        }
    }
    
    @Published var selectedTheme: CalculatorTheme {
        didSet {
            UserDefaults.standard.set(selectedTheme.rawValue, forKey: "selectedTheme")
        }
    }
    
    // Singleton instance
    static let shared = SettingsManager()
    
    private init() {
        // Load saved settings or use defaults
        self.soundEnabled = UserDefaults.standard.object(forKey: "soundEnabled") as? Bool ?? true
        self.hapticsEnabled = UserDefaults.standard.object(forKey: "hapticsEnabled") as? Bool ?? true
        
        // Load saved theme or use default
        if let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme"),
           let theme = CalculatorTheme(rawValue: savedTheme) {
            self.selectedTheme = theme
        } else {
            self.selectedTheme = .glamPink
        }
    }
    
    // Reset all settings to defaults
    func resetToDefaults() {
        soundEnabled = true
        hapticsEnabled = true
        selectedTheme = .glamPink
    }
}
