import Foundation

struct FunctionDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: FunctionName
    let genericParamters: GenericParameterClause?
    let parameters: [Parameter]
    let throwBehavior: ThrowsModifier?
    let result: FunctionResult?
    let `where`: GenericWhereClause?
    let body: CodeBlock?
}

enum FunctionName {
    case identifier(Identifier)
    case `operator`(Operator)
}

struct Parameter {
    let externalName: Identifier?
    let localName: Identifier
    let type: TypeAnnotation
    let modifier: ParameterModifier?
}

enum ParameterModifier {
    case `default`(Expression)
    case ellipsis
}

enum ThrowsModifier {
    case `throws`, `rethrows`
}

struct FunctionResult {
    let attributes: [Attribute]
    let type: Type
}
