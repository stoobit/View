├─arguments: LabeledExprListSyntax
│ ├─[1]: LabeledExprSyntax
│ │ ├─label: identifier("values")
│ │ ├─colon: colon
│ │ ├─expression: FunctionCallExprSyntax
│ │ │ ├─calledExpression: MemberAccessExprSyntax
│ │ │ │ ├─period: period
│ │ │ │ ╰─declName: DeclReferenceExprSyntax
│ │ │ │   ╰─baseName: identifier("value")
│ │ │ ├─leftParen: leftParen
│ │ │ ├─arguments: LabeledExprListSyntax
│ │ │ │ ├─[0]: LabeledExprSyntax
│ │ │ │ │ ├─expression: StringLiteralExprSyntax
│ │ │ │ │ │ ├─openingQuote: stringQuote
│ │ │ │ │ │ ├─segments: StringLiteralSegmentListSyntax
│ │ │ │ │ │ │ ╰─[0]: StringSegmentSyntax
│ │ │ │ │ │ │   ╰─content: stringSegment("name")
│ │ │ │ │ │ ╰─closingQuote: stringQuote
│ │ │ │ │ ╰─trailingComma: comma
│ │ │ │ ╰─[1]: LabeledExprSyntax
│ │ │ │   ├─label: identifier("type")
│ │ │ │   ├─colon: colon
│ │ │ │   ╰─expression: MemberAccessExprSyntax
│ │ │ │     ├─base: DeclReferenceExprSyntax
│ │ │ │     │ ╰─baseName: identifier("String")
│ │ │ │     ├─period: period
│ │ │ │     ╰─declName: DeclReferenceExprSyntax
│ │ │ │       ╰─baseName: keyword(SwiftSyntax.Keyword.self)
│ │ │ ├─rightParen: rightParen
│ │ │ ╰─additionalTrailingClosures: MultipleTrailingClosureElementListSyntax

│ ╰─[2]: LabeledExprSyntax
│   ╰─expression: FunctionCallExprSyntax
│     ├─calledExpression: MemberAccessExprSyntax
│     │ ├─period: period
│     │ ╰─declName: DeclReferenceExprSyntax
│     │   ╰─baseName: identifier("value")
│     ├─leftParen: leftParen
│     ├─arguments: LabeledExprListSyntax
│     │ ├─[0]: LabeledExprSyntax
│     │ │ ├─expression: StringLiteralExprSyntax
│     │ │ │ ├─openingQuote: stringQuote
│     │ │ │ ├─segments: StringLiteralSegmentListSyntax
│     │ │ │ │ ╰─[0]: StringSegmentSyntax
│     │ │ │ │   ╰─content: stringSegment("age")
│     │ │ │ ╰─closingQuote: stringQuote
│     │ │ ╰─trailingComma: comma
│     │ ╰─[1]: LabeledExprSyntax
│     │   ├─label: identifier("type")
│     │   ├─colon: colon
│     │   ╰─expression: MemberAccessExprSyntax
│     │     ├─base: DeclReferenceExprSyntax
│     │     │ ╰─baseName: identifier("Int")
│     │     ├─period: period
│     │     ╰─declName: DeclReferenceExprSyntax
│     │       ╰─baseName: keyword(SwiftSyntax.Keyword.self)
│     ├─rightParen: rightParen
│     ╰─additionalTrailingClosures: MultipleTrailingClosureElementListSyntax
