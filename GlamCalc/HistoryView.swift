//
//  HistoryView.swift
//  GlamCalc
//
//  Created by Claude
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var calculator: CalculatorModel
    let theme: CalculatorTheme
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                // Theme-based gradient background
                LinearGradient(
                    gradient: Gradient(colors: theme.historyBackgroundColors),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                if calculator.history.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "clock.fill")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(theme.historyEmptyIconColor)
                        Text("No History Yet")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(theme.historyTextColor)
                        Text("Your calculations will appear here")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(theme.historySecondaryTextColor)
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 14) {
                            ForEach(calculator.history) { item in
                                HistoryRowView(item: item, theme: theme) {
                                    calculator.useHistoryResult(item.result)
                                    dismiss()
                                }
                            }
                        }
                        .padding(20)
                    }
                }
            }
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        dismiss()
                    }
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(theme.historyTextColor)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !calculator.history.isEmpty {
                        Button("Clear") {
                            withAnimation {
                                calculator.clearHistory()
                            }
                        }
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(theme.historyTextColor)
                    }
                }
            }
        }
    }
}

struct HistoryRowView: View {
    let item: CalculationHistory
    let theme: CalculatorTheme
    let action: () -> Void

    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter.string(from: item.timestamp)
    }

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(item.expression)
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(theme.historyTextColor)
                    Spacer()
                }

                HStack {
                    Text("= \(item.result)")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(theme.historyTextColor)
                    Spacer()
                    Text(formattedDate)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(theme.historySecondaryTextColor)
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        LinearGradient(
                            colors: theme.historyCardColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .opacity(0.85)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(
                                RadialGradient(
                                    colors: [
                                        Color.white.opacity(0.25),
                                        Color.clear
                                    ],
                                    center: .top,
                                    startRadius: 5,
                                    endRadius: 80
                                )
                            )
                    )
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                    .shadow(color: theme.historyGlowColor, radius: 15, x: 0, y: 8)
            )
        }
        .accessibilityLabel("Calculation: \(item.expression) equals \(item.result)")
        .accessibilityHint("Tap to use this result")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(calculator: CalculatorModel(), theme: .glamPink)
            .preferredColorScheme(.dark)
    }
}
