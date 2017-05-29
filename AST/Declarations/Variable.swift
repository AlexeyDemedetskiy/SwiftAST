import Foundation

enum VariableDeclaration {
    case patterInitializer(PatternInitializerList)
    case computed(ComputedVariableDeclaration)
    case geterSetter(GetterSetterVariableDeclaration)
    case willSetDidSet(WillSetDidSetVariableDeclaration)
    case `protocol`(ProtocolVariableDeclaration)
}

struct ComputedVariableDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let type: TypeAnnotation
    let code: CodeBlock
}

struct GetterSetterVariableDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let type: TypeAnnotation
    let getter: GetterBlock
    let setter: SetterBlock?
}

struct GetterBlock {
    let attributes: [Attribute]
    let mutation: MutationModifier?
    let code: CodeBlock
}

struct SetterBlock {
    let attributes: [Attribute]
    let mutation: MutationModifier?
    let setterName: Identifier?
    let code: CodeBlock
}

struct ProtocolVariableDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let type: TypeAnnotation
    let getter: GetterKeywordClause
    let setter: SetterKeywordClause?
}

struct GetterKeywordClause {
    let attributes: [Attribute]
    let mutation: MutationModifier?
}

struct SetterKeywordClause {
    let attributes: [Attribute]
    let mutation: MutationModifier?
}

struct WillSetDidSetVariableDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    
    /// At least one of two must be non nil.
    let type: TypeAnnotation?
    let initializer: Initializer?
    
    let willSet: WillSetClause?
    let didSetClause: DidSetClause?
}

struct WillSetClause {
    let attributes: [Attribute]
    let newValueName: Identifier?
    let code: CodeBlock
}

struct DidSetClause {
    let attributes: [Attribute]
    let oldValueName: Identifier?
    let code: CodeBlock
}
