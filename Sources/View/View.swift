// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@freestanding(declaration, names: arbitrary)
public macro View<Content: View, each T>(
    _ name: String, values: repeat Value<each T>,
    @ViewBuilder content: (repeat each T) -> Content
) = #externalMacro(
    module: "ViewMacros", type: "ViewMacro"
)
