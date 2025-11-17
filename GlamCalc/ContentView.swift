//
//  ContentView.swift
//  GlamCalc
//
//  The main calculator interface view. Contains the display, calculator buttons,
//  theme-based gradient backgrounds, and navigation to settings, history, and theme
//  selector. Handles all button press interactions and manages sound/haptic feedback.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var calculator = CalculatorModel()
    @ObservedObject var settings = SettingsManager.shared
    @State private var showHistory = false
    @State private var showThemeSelector = false
    @State private var showSettings = false

    let buttons: [[CalculatorButton]] = [
        [.clear, .plusMinus, .percent, .divide],
        [.number(7), .number(8), .number(9), .multiply],
        [.number(4), .number(5), .number(6), .subtract],
        [.number(1), .number(2), .number(3), .add]
    ]
    
    let bottomButtons: [CalculatorButton] = [.number(0), .decimal, .equals]

    var body: some View {
        ZStack {
            // Theme-based gradient background
            LinearGradient(
                gradient: Gradient(colors: settings.selectedTheme.backgroundColors),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Subtle sparkle overlay
            Color.white.opacity(0.02)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Top icon buttons row
                HStack(spacing: 12) {
                    // Theme button (single button replacing the three decorative icons)
                    BubbleIconButton(icon: "sparkles", color: settings.selectedTheme.iconColor, action: {
                        showThemeSelector = true
                    })
                    
                    Spacer()
                    
                    // Settings and History buttons
                    BubbleIconButton(icon: "gearshape.fill", color: settings.selectedTheme.iconColor, action: {
                        showSettings = true
                    })
                    BubbleIconButton(icon: "clock.fill", color: settings.selectedTheme.iconColor, action: {
                        showHistory = true
                    })
                }
                .padding(.horizontal, 24)
                .padding(.top, 60)
                .padding(.bottom, 12)

                // Title with theme-based styling
                HStack(spacing: 4) {
                    Text("Glam")
                        .font(.system(size: 36, weight: .semibold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: settings.selectedTheme.titleColors,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Text("✨")
                        .font(.system(size: 28))
                    
                    Text("CALC")
                        .font(.system(size: 36, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 16)

                // Calculator container with rounded corners
                VStack(spacing: 0) {
                    // Display area
                    VStack(spacing: 4) {
                        Text(calculator.display)
                            .font(.system(size: 68, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal, 28)
                            .padding(.top, 32)
                            .padding(.bottom, 24)
                            .accessibilityLabel("Display: \(calculator.display)")
                    }
                    
                    // Button grid - compact and cute
                    VStack(spacing: 12) {
                        ForEach(buttons, id: \.self) { row in
                            HStack(spacing: 12) {
                                ForEach(row, id: \.self) { button in
                                    BubbleCalculatorButton(button: button, theme: settings.selectedTheme) {
                                        handleButtonPress(button)
                                    }
                                }
                            }
                        }
                        
                        // Bottom row with wide 0 button
                        HStack(spacing: 12) {
                            // Wide 0 button (pill-shaped)
                            Button(action: {
                                handleButtonPress(.number(0))
                            }) {
                                Text("0")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                    .shadow(color: Color.black.opacity(0.15), radius: 1, x: 0, y: 1)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 70)
                                    .background(
                                        ZStack {
                                            Capsule()
                                                .fill(
                                                    LinearGradient(
                                                        colors: settings.selectedTheme.numberButtonColors,
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    )
                                                )
                                                .opacity(0.92)
                                            
                                            // Subtle inner highlight border
                                            Capsule()
                                                .strokeBorder(
                                                    LinearGradient(
                                                        colors: [
                                                            Color.white.opacity(0.3),
                                                            Color.clear
                                                        ],
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    ),
                                                    lineWidth: 1.5
                                                )
                                            
                                            // Enhanced radial highlight at top
                                            Capsule()
                                                .fill(
                                                    RadialGradient(
                                                        colors: [
                                                            Color.white.opacity(0.45),
                                                            Color.white.opacity(0.08),
                                                            Color.clear
                                                        ],
                                                        center: .top,
                                                        startRadius: 5,
                                                        endRadius: 60
                                                    )
                                                )
                                        }
                                    )
                                    .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 3)
                                    .shadow(color: settings.selectedTheme.shadowColor, radius: 20, x: 0, y: 5)
                            }
                            
                            BubbleCalculatorButton(button: .decimal, theme: settings.selectedTheme) {
                                handleButtonPress(.decimal)
                            }
                            
                            BubbleCalculatorButton(button: .equals, theme: settings.selectedTheme) {
                                handleButtonPress(.equals)
                            }
                        }
                        .frame(height: 70)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 28)
                }
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(
                            LinearGradient(
                                colors: settings.selectedTheme.containerColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: Color.black.opacity(0.08), radius: 20, x: 0, y: 10)
                )
                .padding(.horizontal, 16)
                
                Spacer()
            }
        }
        .sheet(isPresented: $showHistory) {
            HistoryView(calculator: calculator, theme: settings.selectedTheme)
        }
        .sheet(isPresented: $showThemeSelector) {
            ThemeSelectorView(selectedTheme: $settings.selectedTheme)
        }
        .sheet(isPresented: $showSettings) {
            SettingsView(settings: settings, theme: settings.selectedTheme)
        }
    }

    private func handleButtonPress(_ button: CalculatorButton) {
        // Play sound if enabled
        if settings.soundEnabled {
            SoundManager.shared.playClickSound()
        }
        
        // Haptic feedback if enabled
        if settings.hapticsEnabled {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }

        switch button {
        case .number(let value):
            calculator.inputNumber("\(value)")
        case .decimal:
            calculator.inputNumber(".")
        case .add:
            calculator.setOperation(.add)
        case .subtract:
            calculator.setOperation(.subtract)
        case .multiply:
            calculator.setOperation(.multiply)
        case .divide:
            calculator.setOperation(.divide)
        case .equals:
            calculator.performOperation()
        case .clear:
            calculator.clear()
        case .delete:
            calculator.backspace()
        case .percent:
            calculator.calculatePercentage()
        case .plusMinus:
            calculator.toggleSign()
        }
    }
}

// MARK: - Bubble Icon Button

struct BubbleIconButton: View {
    let icon: String
    let color: Color
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.15), radius: 1, x: 0, y: 1)
                .frame(width: 50, height: 50)
                .background(
                    ZStack {
                        Circle()
                            .fill(color)
                            .opacity(0.92)
                        
                        // Subtle inner highlight border
                        Circle()
                            .strokeBorder(
                                Color.white.opacity(0.3),
                                lineWidth: 1.5
                            )
                        
                        // Enhanced radial highlight at top for soft-glass effect
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [
                                        Color.white.opacity(0.45),
                                        Color.white.opacity(0.08),
                                        Color.clear
                                    ],
                                    center: .top,
                                    startRadius: 2,
                                    endRadius: 40
                                )
                            )
                    }
                )
                // Enhanced shadow for better separation
                .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 3)
                .shadow(color: color.opacity(0.25), radius: 20, x: 0, y: 5)
        }
    }
}

// MARK: - Calculator Button

enum CalculatorButton: Hashable {
    case number(Int)
    case decimal
    case add, subtract, multiply, divide
    case equals
    case clear, delete
    case percent, plusMinus

    var title: String {
        switch self {
        case .number(let value):
            return "\(value)"
        case .decimal:
            return "."
        case .add:
            return "+"
        case .subtract:
            return "−"
        case .multiply:
            return "×"
        case .divide:
            return "÷"
        case .equals:
            return "="
        case .clear:
            return "AC"
        case .delete:
            return "⌫"
        case .percent:
            return "%"
        case .plusMinus:
            return "±"
        }
    }

    func backgroundColor(for theme: CalculatorTheme) -> LinearGradient {
        switch self {
        case .number, .decimal:
            // Number buttons
            return LinearGradient(
                colors: theme.numberButtonColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .add, .subtract, .multiply, .divide, .equals:
            // Operator buttons
            return LinearGradient(
                colors: theme.operatorButtonColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .clear, .delete, .percent, .plusMinus:
            // Utility buttons
            return LinearGradient(
                colors: theme.utilityButtonColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }

    var foregroundColor: Color {
        return .white
    }
}

// MARK: - Bubble Calculator Button

struct BubbleCalculatorButton: View {
    let button: CalculatorButton
    let theme: CalculatorTheme
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(button.title)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .foregroundColor(button.foregroundColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(
                    ZStack {
                        // Base translucent crystal-glass color
                        Circle()
                            .fill(button.backgroundColor(for: theme))
                            .opacity(0.85)
                        
                        // Gentle radial highlight for soft-glass 3D effect
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [
                                        Color.white.opacity(0.35),
                                        Color.clear
                                    ],
                                    center: .top,
                                    startRadius: 5,
                                    endRadius: 50
                                )
                            )
                    }
                )
                // Very soft outer shadow with low opacity
                .shadow(color: theme.shadowColor, radius: 24, x: 0, y: 4)
        }
        .accessibilityLabel(button.title)
        .accessibilityHint("Button for \(button.title)")
    }
}

// MARK: - Color Extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
