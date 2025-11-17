//
//  SettingsView.swift
//  GlamCalc
//
//  Created by Claude
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings: SettingsManager
    let theme: CalculatorTheme
    @Environment(\.dismiss) private var dismiss
    @State private var showResetConfirmation = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Theme-based gradient background
                LinearGradient(
                    gradient: Gradient(colors: theme.backgroundColors),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Settings rows container
                    VStack(spacing: 16) {
                        // Sound toggle
                        SettingsToggleRow(
                            icon: "speaker.wave.2.fill",
                            title: "Sound",
                            subtitle: "Button click sounds",
                            isOn: $settings.soundEnabled,
                            theme: theme
                        )
                        
                        // Haptics toggle
                        SettingsToggleRow(
                            icon: "waveform",
                            title: "Haptics",
                            subtitle: "Light vibrations",
                            isOn: $settings.hapticsEnabled,
                            theme: theme
                        )
                        
                        // Reset button
                        SettingsResetButton(theme: theme) {
                            showResetConfirmation = true
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                }
            }
            .alert("Reset Settings", isPresented: $showResetConfirmation) {
                Button("Cancel", role: .cancel) { }
                Button("Reset", role: .destructive) {
                    withAnimation {
                        settings.resetToDefaults()
                    }
                    // Provide haptic feedback
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                }
            } message: {
                Text("This will reset all settings and theme to default. Are you sure?")
            }
        }
    }
}

// MARK: - Settings Toggle Row

struct SettingsToggleRow: View {
    let icon: String
    let title: String
    let subtitle: String
    @Binding var isOn: Bool
    let theme: CalculatorTheme
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: theme.numberButtonColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .opacity(0.85)
                    .frame(width: 50, height: 50)
                
                // Gentle radial highlight
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.white.opacity(0.35),
                                Color.clear
                            ],
                            center: .top,
                            startRadius: 2,
                            endRadius: 30
                        )
                    )
                    .frame(width: 50, height: 50)
                
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            // Text content
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
            
            // Toggle
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(Color(hex: theme.numberButtonColors.first?.description ?? "FFB3D1"))
                .onChange(of: isOn) { _ in
                    // Provide haptic feedback when toggling
                    if SettingsManager.shared.hapticsEnabled {
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.impactOccurred()
                    }
                }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        colors: theme.containerColors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color.white.opacity(0.15),
                                    Color.clear
                                ],
                                center: .top,
                                startRadius: 5,
                                endRadius: 80
                            )
                        )
                )
                .shadow(color: Color.black.opacity(0.08), radius: 15, x: 0, y: 5)
                .shadow(color: theme.shadowColor, radius: 20, x: 0, y: 8)
        )
    }
}

// MARK: - Settings Reset Button

struct SettingsResetButton: View {
    let theme: CalculatorTheme
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                // Icon
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.red.opacity(0.8), Color.red.opacity(0.6)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .opacity(0.85)
                        .frame(width: 50, height: 50)
                    
                    // Gentle radial highlight
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color.white.opacity(0.35),
                                    Color.clear
                                ],
                                center: .top,
                                startRadius: 2,
                                endRadius: 30
                            )
                        )
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "arrow.counterclockwise")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                // Text content
                VStack(alignment: .leading, spacing: 4) {
                    Text("Reset Settings")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("Restore all defaults")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        LinearGradient(
                            colors: theme.containerColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(
                                RadialGradient(
                                    colors: [
                                        Color.white.opacity(0.15),
                                        Color.clear
                                    ],
                                    center: .top,
                                    startRadius: 5,
                                    endRadius: 80
                                )
                            )
                    )
                    .shadow(color: Color.black.opacity(0.08), radius: 15, x: 0, y: 5)
                    .shadow(color: Color.red.opacity(0.2), radius: 20, x: 0, y: 8)
            )
        }
    }
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: SettingsManager.shared, theme: .glamPink)
            .preferredColorScheme(.dark)
    }
}
