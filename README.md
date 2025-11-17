# ✨ GlamCalc

<div align="center">

![Platform](https://img.shields.io/badge/platform-iOS-lightgrey)
![Swift](https://img.shields.io/badge/Swift-5.9-orange)
![iOS](https://img.shields.io/badge/iOS-17.0+-blue)
![License](https://img.shields.io/badge/license-MIT-green)

**A beautiful, pastel-themed calculator app for iOS with crystal-glass aesthetics**

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Usage](#-usage) • [Architecture](#-architecture) • [Contributing](#-contributing)

</div>

---

## 🌸 About

GlamCalc is a modern iOS calculator app that combines powerful functionality with stunning visual design. Featuring soft pastel colors, frosted glass effects, and smooth animations, GlamCalc transforms everyday calculations into a delightful experience.

## ✨ Features

### 🎨 **Six Beautiful Themes**
- **Glam Pink** - Vibrant, warm pink gradient (default)
- **Crystal Glow** - Cool, icy translucent pink with blue undertones
- **Rose Gold** - Soft metallic gradient with peachy-gold tones
- **Midnight Glam** - Deep plum and navy purple for elegant dark mode
- **Cotton Candy** - Baby blue to pink pastel blend
- **Lilac Dream** - Soft lavender to violet gradient

### ⚙️ **Customizable Settings**
- 🔊 **Sound Effects** - Optional button click sounds
- 📳 **Haptic Feedback** - Tactile vibrations on button press
- 💾 **Persistent Preferences** - All settings saved automatically
- 🔄 **Reset Option** - Restore defaults with one tap

### 🧮 **Full Calculator Functionality**
- Basic operations (+, −, ×, ÷)
- Percentage calculations
- Sign toggle (±)
- Clear and backspace
- Large, readable display with auto-scaling text
- Calculation history tracking

### 🎭 **Beautiful Design**
- Crystal-glass button effects with radial highlights
- Soft shadows and inner borders for depth
- Smooth gradient backgrounds
- Enhanced contrast for readability
- Accessible design with VoiceOver support

## 📱 Screenshots

> *Add screenshots of your app here showing different themes and the settings panel*

## 🛠 Installation

### Requirements
- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/GlamCalc.git
   cd GlamCalc
   ```

2. **Open in Xcode**
   ```bash
   open GlamCalc.xcodeproj
   ```

3. **Build and Run**
   - Select your target device or simulator
   - Press `⌘ + R` to build and run

## 🎯 Usage

### Basic Calculations
1. Tap numbers and operators to build your calculation
2. Press `=` to see the result
3. Use `AC` to clear, or `±` to toggle sign

### Changing Themes
1. Tap the ✨ sparkles icon at the top
2. Select from 6 beautiful themes
3. Your choice is saved automatically

### Adjusting Settings
1. Tap the ⚙️ gear icon at the top
2. Toggle sound effects and haptic feedback
3. Use "Reset Settings" to restore defaults

### Viewing History
1. Tap the 🕐 clock icon at the top
2. Browse your calculation history
3. Tap any result to reuse it

## 🏗 Architecture

### Project Structure

```
GlamCalc/
├── GlamCalcApp.swift              # App entry point
├── ContentView.swift              # Main calculator UI
├── CalculatorModel.swift          # Business logic & calculations
├── CalculatorTheme.swift          # Theme system with color definitions
├── SettingsManager.swift          # Settings persistence with UserDefaults
├── SoundManager.swift             # Audio feedback system
├── Views/
│   ├── HistoryView.swift          # Calculation history panel
│   ├── SettingsView.swift         # Settings configuration panel
│   └── ThemeSelectorView.swift    # Theme picker bottom sheet
└── Assets.xcassets/               # App icons and assets
```

### Key Technologies
- **SwiftUI** - Modern declarative UI framework
- **Combine** - Reactive programming for settings
- **UserDefaults** - Persistent storage
- **AVFoundation** - Audio playback
- **UIKit Haptics** - Tactile feedback

### Design Patterns
- **MVVM** - Model-View-ViewModel architecture
- **Singleton** - SettingsManager shared instance
- **Observer** - Published properties with Combine
- **Dependency Injection** - Theme passing to child views

## 🎨 Customization

### Adding a New Theme

1. Open `CalculatorTheme.swift`
2. Add a new case to the enum:
   ```swift
   case myTheme = "My Theme"
   ```
3. Define colors in each computed property:
   ```swift
   var backgroundColors: [Color] {
       switch self {
       case .myTheme:
           return [Color(hex: "FF00FF"), Color(hex: "00FFFF")]
       // ... other cases
       }
   }
   ```

### Changing Button Styles

Edit the `BubbleCalculatorButton` struct in `ContentView.swift` to modify:
- Font size and weight
- Border radius and shadows
- Opacity and gradients
- Animations and transitions

## 🐛 Known Issues

- None currently! 🎉

## 🗺 Roadmap

- [ ] iPad support with landscape mode
- [ ] Scientific calculator mode
- [ ] Custom theme creator
- [ ] Export calculation history
- [ ] Widget support
- [ ] Apple Watch companion app
- [ ] Keyboard shortcuts (iPad)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by modern design trends in calculator apps
- Built with SwiftUI and love 💕
- Sound effects from Apple's system audio library

## 👤 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Twitter: [@yourhandle](https://twitter.com/yourhandle)

## 📧 Contact

Have questions or suggestions? Feel free to reach out!

- Open an issue on GitHub
- Email: your.email@example.com

---

<div align="center">

**Made with ✨ and Swift**

⭐️ Star this repo if you like GlamCalc!

</div>
