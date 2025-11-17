# GlamCalc ✨

A beautifully designed iOS calculator app with glamorous themes, smooth animations, and delightful user interactions.

## Features

### 🎨 Multiple Themes
- **Glam Pink** - Classic glamorous pink gradient
- **Crystal Glow** - Soft crystal-inspired colors
- **Rose Gold** - Warm rose gold tones
- **Midnight Glam** - Dark elegant theme
- **Cotton Candy** - Pastel blue and pink blend
- **Lilac Dream** - Soft purple gradient

### 🧮 Calculator Features
- Basic arithmetic operations (addition, subtraction, multiplication, division)
- Percentage calculations
- Sign toggling (positive/negative)
- Decimal support
- Clear and backspace functionality
- Scientific notation for very large or small numbers
- 15-digit display limit

### 📜 History
- View all past calculations
- Tap any history item to reuse the result
- Timestamps for each calculation
- Clear history option
- Stores up to 50 recent calculations

### ⚙️ Settings
- Toggle sound effects on/off
- Toggle haptic feedback on/off
- Reset all settings to defaults
- Persistent settings using UserDefaults

### 🎵 Sound & Haptics
- Button click sounds using system audio
- Light haptic feedback for tactile response
- Can be individually enabled/disabled

### 🎭 User Interface
- Gradient backgrounds matching selected theme
- Bubble-style buttons with soft-glass effect
- Radial highlights for 3D appearance
- Smooth shadows and glows
- Accessibility labels and hints
- Sheet presentations for history, settings, and theme selector

## Architecture

### Files Structure

```
GlamCalc/
├── GlamCalcApp.swift          # App entry point
├── ContentView.swift          # Main calculator interface
├── ThemeSelectorView.swift    # Theme selection sheet
├── HistoryView.swift          # Calculation history sheet
├── SettingsView.swift         # App settings sheet
├── CalculatorModel.swift      # Calculator logic and state
├── CalculatorTheme.swift      # Theme definitions and colors
├── SettingsManager.swift      # Settings persistence
└── SoundManager.swift         # Audio management
```

### Design Patterns

- **MVVM Architecture**: Views observe model changes via `@Published` properties
- **Singleton Pattern**: `SettingsManager` and `SoundManager` use shared instances
- **SwiftUI Declarative UI**: All interfaces built with SwiftUI
- **Combine Framework**: Observable objects for reactive updates

## Technical Details

### Requirements
- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

### Frameworks Used
- SwiftUI - UI framework
- Foundation - Core functionality
- AVFoundation - Audio playback
- Combine - Reactive programming

### Key Components

#### CalculatorModel
- Manages calculator state and operations
- Handles number input and display formatting
- Maintains calculation history
- Supports chained operations

#### CalculatorTheme
- Defines 6 unique themes
- Provides colors for all UI elements
- Supports gradients and shadow colors
- Theme-specific styling for each component

#### SettingsManager
- Persists user preferences
- Observable for reactive UI updates
- Manages theme selection
- Handles sound and haptic settings

#### SoundManager
- Plays system sounds for button clicks
- Respects user settings
- Configured for ambient audio category

## User Experience

### Interactions
1. **Calculator Buttons**: Tap number, operator, or utility buttons
2. **Theme Selection**: Tap sparkles icon to open theme selector
3. **History**: Tap clock icon to view calculation history
4. **Settings**: Tap gear icon to adjust preferences
5. **History Reuse**: Tap any history item to use that result

### Visual Design
- Soft gradients with multiple color stops
- Translucent glass-effect buttons
- Radial highlights for depth perception
- Theme-coordinated shadows and glows
- Rounded corners throughout (16-40pt radius)

### Accessibility
- VoiceOver labels for all buttons
- Accessibility hints for actions
- High contrast text on all backgrounds
- Large tap targets (50-70pt)

## Future Enhancements

Potential features for future versions:
- Additional scientific functions (sin, cos, tan, log)
- Memory functions (M+, M-, MR, MC)
- Landscape mode with expanded functions
- Export history to CSV or share
- Custom theme creator
- Widget support
- iPad optimization
- More theme options

## Development

### Building the Project
1. Clone the repository
2. Open `GlamCalc.xcodeproj` in Xcode
3. Select your target device or simulator
4. Press ⌘R to build and run

### Testing
- All calculations can be tested manually through the UI
- History persistence can be verified by force-quitting and relaunching
- Settings persistence verified through app restarts
- Themes can be tested by switching between all options

## License

All rights reserved.

## Version History

### Version 1.0
- Initial release
- 6 beautiful themes
- Basic and advanced calculator operations
- Calculation history
- Sound and haptic feedback
- Settings management
- Theme customization

---

Made with ✨ and SwiftUI
