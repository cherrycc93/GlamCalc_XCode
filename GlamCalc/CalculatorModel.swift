//
//  CalculatorModel.swift
//  GlamCalc
//
//  Created by Claude
//

import Foundation

enum Operation: String {
    case add = "+"
    case subtract = "−"
    case multiply = "×"
    case divide = "÷"
    case percent = "%"
    case power = "^"
    case none = ""
}

struct CalculationHistory: Identifiable {
    let id = UUID()
    let expression: String
    let result: String
    let timestamp: Date
}

class CalculatorModel: ObservableObject {
    @Published var display = "0"
    @Published var history: [CalculationHistory] = []

    private var currentValue: Double = 0
    private var previousValue: Double = 0
    private var currentOperation: Operation = .none
    private var isTypingNumber = false
    private var expression = ""

    // MARK: - Number Input

    func inputNumber(_ number: String) {
        if isTypingNumber {
            if number == "." && display.contains(".") {
                return // Don't allow multiple decimal points
            }
            if display.count < 15 { // Limit display length
                display = display == "0" ? number : display + number
            }
        } else {
            display = number == "." ? "0." : number
            isTypingNumber = true
        }
        expression += number
    }

    // MARK: - Basic Operations

    func setOperation(_ operation: Operation) {
        guard let value = Double(display) else { return }

        if isTypingNumber {
            if currentOperation != .none {
                performOperation()
            } else {
                previousValue = value
            }
        }

        currentOperation = operation
        isTypingNumber = false

        // Update expression
        if !expression.isEmpty {
            expression += " \(operation.rawValue) "
        } else {
            expression = "\(formatNumber(previousValue)) \(operation.rawValue) "
        }
    }

    func performOperation() {
        guard let currentValue = Double(display) else { return }

        var result: Double = 0

        switch currentOperation {
        case .add:
            result = previousValue + currentValue
        case .subtract:
            result = previousValue - currentValue
        case .multiply:
            result = previousValue * currentValue
        case .divide:
            if currentValue == 0 {
                display = "Error"
                clear()
                return
            }
            result = previousValue / currentValue
        case .power:
            result = pow(previousValue, currentValue)
        case .percent:
            result = previousValue * (currentValue / 100)
        case .none:
            result = currentValue
        }

        // Add to history
        let fullExpression = expression.isEmpty ? "\(formatNumber(previousValue)) \(currentOperation.rawValue) \(formatNumber(currentValue))" : expression + formatNumber(currentValue)
        addToHistory(expression: fullExpression, result: result)

        display = formatNumber(result)
        previousValue = result
        currentOperation = .none
        isTypingNumber = false
        expression = ""
    }

    // MARK: - Advanced Operations

    func calculatePercentage() {
        guard let value = Double(display) else { return }
        let result = value / 100
        display = formatNumber(result)
        currentValue = result
        
        // Reset state so the percentage result becomes the new starting value
        previousValue = result
        currentOperation = .none
        isTypingNumber = false
        expression = ""
    }

    func toggleSign() {
        guard let value = Double(display) else { return }
        let result = -value
        display = formatNumber(result)
        
        // Always update previousValue if we're not currently typing
        // This ensures the toggled value is used in subsequent operations
        if !isTypingNumber {
            previousValue = result
        }
    }

    func calculateSquareRoot() {
        guard let value = Double(display) else { return }
        if value < 0 {
            display = "Error"
            return
        }
        let result = sqrt(value)
        addToHistory(expression: "√\(formatNumber(value))", result: result)
        display = formatNumber(result)
    }

    func calculateSquare() {
        guard let value = Double(display) else { return }
        let result = value * value
        addToHistory(expression: "\(formatNumber(value))²", result: result)
        display = formatNumber(result)
    }

    // MARK: - Clear and Delete Operations

    func clear() {
        display = "0"
        currentValue = 0
        previousValue = 0
        currentOperation = .none
        isTypingNumber = false
        expression = ""
    }

    func clearEntry() {
        display = "0"
        isTypingNumber = false
    }

    func backspace() {
        if isTypingNumber && display.count > 1 {
            display.removeLast()
            if !expression.isEmpty {
                expression.removeLast()
            }
        } else {
            display = "0"
            isTypingNumber = false
        }
    }

    // MARK: - History Management

    private func addToHistory(expression: String, result: Double) {
        let historyItem = CalculationHistory(
            expression: expression,
            result: formatNumber(result),
            timestamp: Date()
        )
        history.insert(historyItem, at: 0)

        // Keep only last 50 calculations
        if history.count > 50 {
            history.removeLast()
        }
    }

    func clearHistory() {
        history.removeAll()
    }

    func useHistoryResult(_ result: String) {
        display = result
        isTypingNumber = false
        if let value = Double(result) {
            previousValue = value
        }
    }

    // MARK: - Helper Functions

    private func formatNumber(_ number: Double) -> String {
        // Remove trailing zeros and unnecessary decimal point
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        formatter.numberStyle = .decimal

        if abs(number) >= 1e10 || (abs(number) < 1e-6 && number != 0) {
            formatter.numberStyle = .scientific
            formatter.maximumFractionDigits = 4
        }

        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}
