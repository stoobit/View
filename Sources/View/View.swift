// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@freestanding(declaration, names: arbitrary)
public macro View<Content: View>(
    _ name: String, @ViewBuilder content: () -> Content
) = #externalMacro(
    module: "ViewMacros", type: "ViewMacro"
)
