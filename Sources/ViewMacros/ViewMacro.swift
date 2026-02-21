import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct ViewMacro: DeclarationMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        let expression = node.arguments.first?.expression.as(StringLiteralExprSyntax.self)!
        let segments = expression!.segments as StringLiteralSegmentListSyntax
        let segment = segments.first?.as(StringSegmentSyntax.self)
        let name = segment?.content.text
        
        return [
            DeclSyntax(try StructDeclSyntax("struct \(raw: name ?? "Alert"): View") {
                try VariableDeclSyntax("var body: some View") {
                    if let statements = node.trailingClosure?.statements {
                        statements
                    }
                }
            })
        ]
    }
}

@main
struct ViewPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ViewMacro.self,
    ]
}
