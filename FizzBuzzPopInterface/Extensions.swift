//
//  Extensions.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 30.04.2023.
//

import SwiftUI

extension Color {
    static let primaryGray = Color(red: 0.2, green: 0.2, blue: 0.2,opacity: 1)
    static let secondaryGray = Color(red: 0.125, green: 0.125, blue: 0.125)
    static let textGray = Color(red: 0.922, green: 0.922, blue: 0.961)
    static let primaryYellow = Color(red: 1, green: 0.867, blue: 0.373)
    static let circleButtonBackgroundGray = Color(red: 0.204, green: 0.204, blue: 0.212)
    static let secondaryYellow = Color(red: 0.771, green: 0.728, blue: 0.568)

}

extension RangeExpression where Bound: FixedWidthInteger {
    func randomElements(_ n: Int) -> [Bound] {
        precondition(n > 0)
        switch self {
        case let range as Range<Bound>: return (0..<n).map { _ in .random(in: range) }
        case let range as ClosedRange<Bound>: return (0..<n).map { _ in .random(in: range) }
        default: return []
        }
    }
}

extension Range where Bound: FixedWidthInteger {
    var randomElement: Bound { .random(in: self) }
}

extension ClosedRange where Bound: FixedWidthInteger {
    var randomElement: Bound { .random(in: self) }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? ""
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
