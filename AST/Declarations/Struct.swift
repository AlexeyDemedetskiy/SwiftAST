import Foundation

struct StructDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let name: Identifier
    let genericParameters: GenericParameterClause?
    let typeInheritance: TypeInheritanceClause?
    let genericConstraints: GenericWhereClause?
    let members: [StructMember]
}

enum StructMember {
    case declaration(Declaration)
    case compilerStatement(CompilerControlStatement)
}
