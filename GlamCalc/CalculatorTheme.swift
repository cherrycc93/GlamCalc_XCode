//
//  CalculatorTheme.swift
//  GlamCalc
//
//  Defines all available calculator themes and their associated color schemes.
//  Each theme provides colors for backgrounds, buttons, text, shadows, and
//  other UI elements to create a cohesive visual experience.
//

import SwiftUI

enum CalculatorTheme: String, CaseIterable, Identifiable {
    case glamPink = "Glam Pink"
    case crystalGlow = "Crystal Glow"
    case roseGold = "Rose Gold"
    case midnightGlam = "Midnight Glam"
    case cottonCandy = "Cotton Candy"
    case lilacDream = "Lilac Dream"
    
    var id: String { rawValue }
    
    // Background gradient colors
    var backgroundColors: [Color] {
        switch self {
        case .glamPink:
            return [
                Color(hex: "FFD1E3"),
                Color(hex: "FFB3D1"),
                Color(hex: "FF99C8")
            ]
        case .crystalGlow:
            return [
                Color(hex: "F8DCEC"),
                Color(hex: "F5CCE3"),
                Color(hex: "F2BAD7")
            ]
        case .roseGold:
            return [
                Color(hex: "FFE8D6"),
                Color(hex: "FFDCC4"),
                Color(hex: "FFCFB2")
            ]
        case .midnightGlam:
            return [
                Color(hex: "2B2E63"),
                Color(hex: "232548"),
                Color(hex: "1A1535")
            ]
        case .cottonCandy:
            return [
                Color(hex: "DFF0FF"),
                Color(hex: "EFDEFF"),
                Color(hex: "FCE1FF")
            ]
        case .lilacDream:
            return [
                Color(hex: "E5D9FF"),
                Color(hex: "D9C8FF"),
                Color(hex: "C8B5FF")
            ]
        }
    }
    
    // Icon button color
    var iconColor: Color {
        switch self {
        case .glamPink:
            return Color(hex: "FFB3D1")
        case .crystalGlow:
            return Color(hex: "F2BAD7")
        case .roseGold:
            return Color(hex: "FFCFB2")
        case .midnightGlam:
            return Color(hex: "5A5E9E")
        case .cottonCandy:
            return Color(hex: "E0D9FF")
        case .lilacDream:
            return Color(hex: "D9C8FF")
        }
    }
    
    // Title gradient colors
    var titleColors: [Color] {
        switch self {
        case .glamPink:
            return [Color(hex: "FFB3D1"), Color(hex: "FFD1E3")]
        case .crystalGlow:
            return [Color(hex: "F2BAD7"), Color(hex: "F8DCEC")]
        case .roseGold:
            return [Color(hex: "FFCFB2"), Color(hex: "FFE8D6")]
        case .midnightGlam:
            return [Color(hex: "8A8ECE"), Color(hex: "AEB2E8")]
        case .cottonCandy:
            return [Color(hex: "C4E0FF"), Color(hex: "FFD1F0")]
        case .lilacDream:
            return [Color(hex: "C8B5FF"), Color(hex: "E5D9FF")]
        }
    }
    
    // Calculator container colors
    var containerColors: [Color] {
        switch self {
        case .glamPink:
            return [
                Color(hex: "FFD1E3").opacity(0.4),
                Color(hex: "FFB3D1").opacity(0.4)
            ]
        case .crystalGlow:
            return [
                Color(hex: "F8DCEC").opacity(0.4),
                Color(hex: "F2BAD7").opacity(0.4)
            ]
        case .roseGold:
            return [
                Color(hex: "FFE8D6").opacity(0.4),
                Color(hex: "FFDCC4").opacity(0.4)
            ]
        case .midnightGlam:
            return [
                Color(hex: "2B2E63").opacity(0.6),
                Color(hex: "232548").opacity(0.6)
            ]
        case .cottonCandy:
            return [
                Color(hex: "DFF0FF").opacity(0.4),
                Color(hex: "FCE1FF").opacity(0.4)
            ]
        case .lilacDream:
            return [
                Color(hex: "E5D9FF").opacity(0.4),
                Color(hex: "D9C8FF").opacity(0.4)
            ]
        }
    }
    
    // Number button colors
    var numberButtonColors: [Color] {
        switch self {
        case .glamPink:
            return [Color(hex: "FFACD6"), Color(hex: "FF5099")]
        case .crystalGlow:
            return [Color(hex: "F0B0D5"), Color(hex: "E890C0")]
        case .roseGold:
            return [Color(hex: "FFC8AA"), Color(hex: "E5B090")]
        case .midnightGlam:
            return [Color(hex: "6468AA"), Color(hex: "5458A0")]
        case .cottonCandy:
            return [Color(hex: "D8CEFF"), Color(hex: "BEB8FF")]
        case .lilacDream:
            return [Color(hex: "D0BEFF"), Color(hex: "B098FF")]
        }
    }
    
    // Operator button colors
    var operatorButtonColors: [Color] {
        switch self {
        case .glamPink:
            return [Color(hex: "FF90C0"), Color(hex: "FF3D78")]
        case .crystalGlow:
            return [Color(hex: "E890C0"), Color(hex: "D870AA")]
        case .roseGold:
            return [Color(hex: "E5B090"), Color(hex: "D99868")]
        case .midnightGlam:
            return [Color(hex: "7478BA"), Color(hex: "6468AA")]
        case .cottonCandy:
            return [Color(hex: "BEB8FF"), Color(hex: "A8A0FF")]
        case .lilacDream:
            return [Color(hex: "B098FF"), Color(hex: "9878FF")]
        }
    }
    
    // Utility button colors
    var utilityButtonColors: [Color] {
        switch self {
        case .glamPink:
            return [Color(hex: "FFC8E0"), Color(hex: "FF9CC0")]
        case .crystalGlow:
            return [Color(hex: "F5D8E8"), Color(hex: "F0BCCE")]
        case .roseGold:
            return [Color(hex: "FFE0CC"), Color(hex: "FFC8AA")]
        case .midnightGlam:
            return [Color(hex: "7478BA"), Color(hex: "6468AA")]
        case .cottonCandy:
            return [Color(hex: "D8ECFF"), Color(hex: "C8DCFF")]
        case .lilacDream:
            return [Color(hex: "DED0FF"), Color(hex: "CEB8FF")]
        }
    }
    
    // Shadow color for buttons
    var shadowColor: Color {
        switch self {
        case .glamPink:
            return Color(hex: "FF66A3").opacity(0.15)
        case .crystalGlow:
            return Color(hex: "E89CC5").opacity(0.15)
        case .roseGold:
            return Color(hex: "E5B896").opacity(0.15)
        case .midnightGlam:
            return Color(hex: "4A4E8E").opacity(0.25)
        case .cottonCandy:
            return Color(hex: "C4C0FF").opacity(0.15)
        case .lilacDream:
            return Color(hex: "B8A5FF").opacity(0.15)
        }
    }
    
    // MARK: - History Panel Colors
    
    // History panel background gradient
    var historyBackgroundColors: [Color] {
        switch self {
        case .glamPink:
            return [Color(hex: "FF99C8"), Color(hex: "FF4D8C")]
        case .crystalGlow:
            return [Color(hex: "F2BAD7"), Color(hex: "D87EB3")]
        case .roseGold:
            return [Color(hex: "FFCFB2"), Color(hex: "D9A07A")]
        case .midnightGlam:
            return [Color(hex: "2B2E63"), Color(hex: "1A1535")]
        case .cottonCandy:
            return [Color(hex: "DFF0FF"), Color(hex: "FCE1FF")]
        case .lilacDream:
            return [Color(hex: "D9C8FF"), Color(hex: "9E8AFF")]
        }
    }
    
    // History row card colors
    var historyCardColors: [Color] {
        switch self {
        case .glamPink:
            return [Color(hex: "FFB3D1"), Color(hex: "FF99C8")]
        case .crystalGlow:
            return [Color(hex: "F8DCEC"), Color(hex: "F2BAD7")]
        case .roseGold:
            return [Color(hex: "FFE8D6"), Color(hex: "FFCFB2")]
        case .midnightGlam:
            return [Color(hex: "5A5E9E"), Color(hex: "4A4E8E")]
        case .cottonCandy:
            return [Color(hex: "EFDEFF"), Color(hex: "DFF0FF")]
        case .lilacDream:
            return [Color(hex: "E5D9FF"), Color(hex: "D9C8FF")]
        }
    }
    
    // History panel glow color (for shadows)
    var historyGlowColor: Color {
        switch self {
        case .glamPink:
            return Color(hex: "FF4D8C").opacity(0.3)
        case .crystalGlow:
            return Color(hex: "E89CC5").opacity(0.3)
        case .roseGold:
            return Color(hex: "E5B896").opacity(0.3)
        case .midnightGlam:
            return Color(hex: "6A6EAE").opacity(0.4)
        case .cottonCandy:
            return Color(hex: "C4C0FF").opacity(0.3)
        case .lilacDream:
            return Color(hex: "B8A5FF").opacity(0.3)
        }
    }
    
    // Text color for history panel
    var historyTextColor: Color {
        switch self {
        case .midnightGlam:
            return .white
        default:
            return .white
        }
    }
    
    // Secondary text color for history panel (timestamp, etc.)
    var historySecondaryTextColor: Color {
        switch self {
        case .midnightGlam:
            return .white.opacity(0.7)
        default:
            return .white.opacity(0.8)
        }
    }
    
    // Empty state icon color
    var historyEmptyIconColor: Color {
        return .white.opacity(0.7)
    }
}
