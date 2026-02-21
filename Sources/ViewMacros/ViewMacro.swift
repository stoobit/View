import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct ViewMacro: DeclarationMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        let name = name(from: node)
        let parameters = parameters(from: node)
        
        return [
            DeclSyntax(try StructDeclSyntax("struct \(raw: name): View") {
                for parameter in parameters {
                    try VariableDeclSyntax(
                        "var \(raw: parameter.name): \(raw: parameter.type)"
                    )
                }
                
                try VariableDeclSyntax("var body: some View") {
                    if let statements = node.trailingClosure?.statements {
                        statements
                    }
                }
            })
        ]
    }
    
    static func parameters(from node: some FreestandingMacroExpansionSyntax) -> [Value] {
        var values: [Value] = []
        let expressions = node.arguments
            .compactMap({ $0 as LabeledExprSyntax })
            .compactMap({ $0.expression.as(FunctionCallExprSyntax.self) })
        
        for expression in expressions {
            let arguments = (expression.arguments as LabeledExprListSyntax)
                .compactMap({ $0 as LabeledExprSyntax })
            
            let nameExpression = arguments[0].expression.as(StringLiteralExprSyntax.self)
            let segments = nameExpression!.segments as StringLiteralSegmentListSyntax
            let segment = segments.first?.as(StringSegmentSyntax.self)
            let name = segment?.content.text ?? ""
            
            let typeExpression = arguments[1].expression.as(MemberAccessExprSyntax.self)
            let base = typeExpression!.base?.as(DeclReferenceExprSyntax.self)
            let type = base?.baseName.text ?? ""
            
            values.append(Value(name: name, type: type))
        }
        
        return values
    }
    
    static func name(from node: some FreestandingMacroExpansionSyntax) -> String {
        let expression = node.arguments.first?.expression.as(StringLiteralExprSyntax.self)!
        let segments = expression!.segments as StringLiteralSegmentListSyntax
        let segment = segments.first?.as(StringSegmentSyntax.self)
        let name = segment?.content.text
        
        return name ?? ""
    }
}

public struct Value {
    var name: String
    var type: String
}

@main
struct ViewPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ViewMacro.self,
    ]
}
