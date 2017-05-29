import Foundation

struct ClassDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let final: Final?
    let name: Identifier
    let genericParameters: GenericParameterClause?
    let typeInheritance: TypeInheritanceClause?
    let genericConstraints: GenericWhereClause?
    let members: [ClassMember]
}

enum Final { case final }

enum ClassMember {
    case declaration(Declaration)
    case compilerStatement(CompilerControlStatement)
}
