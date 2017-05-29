import Foundation

struct InitializerDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let optionalModifier: InitializerOptionalKind?
    let genericParamters: GenericParameterClause?
    let parameters: [Parameter]
    let throwBehavior: ThrowsModifier?
    let `where`: GenericWhereClause?
    let code: CodeBlock
}

enum InitializerOptionalKind {
    case optional
    case implicit
}
