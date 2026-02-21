import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(ViewMacros)
import ViewMacros

let testMacros: [String: Macro.Type] = [
    "View": ViewMacro.self,
]
#endif

final class ViewTests: XCTestCase {
    func testMacro() throws {
        #if canImport(ViewMacros)
        assertMacroExpansion(
            """
            #View("AgeView", values: .value("name", type: String.self), .value("age", type: Int.self)) {
                Text("hi")
            }
            """,
            expandedSource: """
            struct ListRowItem: View {
                var body: some View {
                    Text("Hello, World")
                }
            }
            """,
            macros: testMacros
        )
        #endif
    }

}
