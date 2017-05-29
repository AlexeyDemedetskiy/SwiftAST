import Foundation

struct ProtocolDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let name: Identifier
    let typeInheritance: TypeInheritanceClause?
    let members: [ProtocolMember]
}

enum ProtocolMember {
    case `var`(ProtocolPropertyDeclaration)
    case `func`(ProtocolMethodDeclaration)
    case `init`(ProtocolInitializerDeclaration)
    case `subscript`(ProtocolSubscriptDeclaration)
    case `associatedtype`(ProtocolAssociatedTypeDeclaration)
    case `typealias`(TypealiasDeclaration)
    
    case compilerStatement(CompilerControlStatement)
}

struct ProtocolPropertyDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let type: TypeAnnotation
    let getter: GetterKeywordClause
    let setter: SetterKeywordClause?
}

struct ProtocolMethodDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let genericParameters: GenericParameterClause?
    let parameters: [Parameter]
    let throwBehavior: ThrowsModifier?
    let result: FunctionResult?
    let `where`: GenericWhereClause?
}

struct ProtocolInitializerDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let optionalModifier: InitializerOptionalKind?
    let genericParamters: GenericParameterClause?
    let parameters: [Parameter]
    let throwBehavior: ThrowsModifier?
    let `where`: GenericWhereClause?
}

struct ProtocolSubscriptDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let parameters: [Parameter]
    let result: FunctionResult
    let getter: GetterKeywordClause
    let setter: SetterKeywordClause
}

struct ProtocolAssociatedTypeDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let name: Identifier
    let typeInheritance: TypeInheritanceClause?
    let type: Type?
}
