//
//  CalculatorTheme.swift
//  GlamCalc
//
//  Created by Claude
//

import SwiftUI

enum CalculatorTheme: String, CaseIterable, Identifiable {
    case barbiePink = "Barbie Pink"
    case crystalPink = "Crystal Pink"
    case roseGold = "Rose Gold"
    case midnightGlam = "Midnight Glam"
    case cottonCandy = "Cotton Candy"
    case lavenderDream = "Lavender Dream"
    
    var id: String { rawValue }
    
    // Background gradient colors
    var backgroundColors: [Color] {
        switch self {
        case .barbiePink:
            return [
                Color(hex: "FFE5F3"),
                Color(hex: "FFCDEB"),
                Color(hex: "FFB6E1")
            ]
        case .crystalPink:
            return [
                Color(hex: "F8E8F5"),
                Color(hex: "E8D5F0"),
                Color(hex: "D8C2EB")
            ]
        case .roseGold:
            return [
                Color(hex: "FFF0E8"),
                Color(hex: "FFE0D0"),
                Color(hex: "FFCDB8")
            ]
        case .midnightGlam:
            return [
                Color(hex: "1A1A2E"),
                Color(hex: "16213E"),
                Color(hex: "0F3460")
            ]
        case .cottonCandy:
            return [
                Color(hex: "FFF0F8"),
                Color(hex: "E8F0FF"),
                Color(hex: "D0E8FF")
            ]
        case .lavenderDream:
            return [
                Color(hex: "F0E8FF"),
                Color(hex: "E0D5F8"),
                Color(hex: "D0C2F0")
            ]
        }
    }
    
    // Icon button color
    var iconColor: Color {
        switch self {
        case .barbiePink:
            return Color(hex: "FFCDEB")
        case .crystalPink:
            return Color(hex: "E8D5F0")
        case .roseGold:
            return Color(hex: "FFD0B8")
        case .midnightGlam:
            return Color(hex: "4A5A8A")
        case .cottonCandy:
            return Color(hex: "D0E8FF")
        case .lavenderDream:
            return Color(hex: "D0C2F0")
        }
    }
    
    // Title gradient colors
    var titleColors: [Color] {
        switch self {
        case .barbiePink:
            return [Color(hex: "FFCDEB"), Color(hex: "FFE5F3")]
        case .crystalPink:
            return [Color(hex: "D8C2EB"), Color(hex: "F8E8F5")]
        case .roseGold:
            return [Color(hex: "FFCDB8"), Color(hex: "FFF0E8")]
        case .midnightGlam:
            return [Color(hex: "7A8ABE"), Color(hex: "9FA8DA")]
        case .cottonCandy:
            return [Color(hex: "B8D8FF"), Color(hex: "FFD8F0")]
        case .lavenderDream:
            return [Color(hex: "C0B0E8"), Color(hex: "E8D8FF")]
        }
    }
    
    // Calculator container colors
    var containerColors: [Color] {
        switch self {
        case .barbiePink:
            return [
                Color(hex: "FFE5F3").opacity(0.4),
                Color(hex: "FFCDEB").opacity(0.4)
            ]
        case .crystalPink:
            return [
                Color(hex: "F8E8F5").opacity(0.4),
                Color(hex: "E8D5F0").opacity(0.4)
            ]
        case .roseGold:
            return [
                Color(hex: "FFF0E8").opacity(0.4),
                Color(hex: "FFE0D0").opacity(0.4)
            ]
        case .midnightGlam:
            return [
                Color(hex: "1A1A2E").opacity(0.6),
                Color(hex: "16213E").opacity(0.6)
            ]
        case .cottonCandy:
            return [
                Color(hex: "FFF0F8").opacity(0.4),
                Color(hex: "E8F0FF").opacity(0.4)
            ]
        case .lavenderDream:
            return [
                Color(hex: "F0E8FF").opacity(0.4),
                Color(hex: "E0D5F8").opacity(0.4)
            ]
        }
    }
    
    // Number button colors
    var numberButtonColors: [Color] {
        switch self {
        case .barbiePink:
            return [Color(hex: "FFCDEB"), Color(hex: "FF9ACD")]
        case .crystalPink:
            return [Color(hex: "E8D5F0"), Color(hex: "D0B8E8")]
        case .roseGold:
            return [Color(hex: "FFD0B8"), Color(hex: "FFB890")]
        case .midnightGlam:
            return [Color(hex: "4A5A8A"), Color(hex: "3A4A7A")]
        case .cottonCandy:
            return [Color(hex: "D0E8FF"), Color(hex: "B8D0FF")]
        case .lavenderDream:
            return [Color(hex: "D0C2F0"), Color(hex: "B8A8E8")]
        }
    }
    
    // Operator button colors
    var operatorButtonColors: [Color] {
        switch self {
        case .barbiePink:
            return [Color(hex: "FFB8E1"), Color(hex: "FF85BA")]
        case .crystalPink:
            return [Color(hex: "D8C2EB"), Color(hex: "C0A8E0")]
        case .roseGold:
            return [Color(hex: "FFB890"), Color(hex: "FF9860")]
        case .midnightGlam:
            return [Color(hex: "5A6A9A"), Color(hex: "4A5A8A")]
        case .cottonCandy:
            return [Color(hex: "B8D0FF"), Color(hex: "A0B8F8")]
        case .lavenderDream:
            return [Color(hex: "B8A8E8"), Color(hex: "A090D8")]
        }
    }
    
    // Utility button colors
    var utilityButtonColors: [Color] {
        switch self {
        case .barbiePink:
            return [Color(hex: "FFE0F0"), Color(hex: "FFAFD5")]
        case .crystalPink:
            return [Color(hex: "F8E8F5"), Color(hex: "E0C8EB")]
        case .roseGold:
            return [Color(hex: "FFF0E8"), Color(hex: "FFD0A8")]
        case .midnightGlam:
            return [Color(hex: "5A6A9A"), Color(hex: "4A5A8A")]
        case .cottonCandy:
            return [Color(hex: "FFF0F8"), Color(hex: "D0E8FF")]
        case .lavenderDream:
            return [Color(hex: "F0E8FF"), Color(hex: "C8B8E8")]
        }
    }
    
    // Shadow color for buttons
    var shadowColor: Color {
        switch self {
        case .barbiePink:
            return Color(hex: "FF9ACD").opacity(0.15)
        case .crystalPink:
            return Color(hex: "D0B8E8").opacity(0.15)
        case .roseGold:
            return Color(hex: "FFB890").opacity(0.15)
        case .midnightGlam:
            return Color(hex: "3A4A7A").opacity(0.25)
        case .cottonCandy:
            return Color(hex: "B8D0FF").opacity(0.15)
        case .lavenderDream:
            return Color(hex: "B8A8E8").opacity(0.15)
        }
    }
}
