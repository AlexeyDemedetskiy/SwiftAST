import Foundation

struct ExtensionDeclaration {
    let attributes: [Attribute]
    let accessModifier: AccessLevelModifier?
    let type: Identifier
    let specialization: ExtensionSpecialization?
    let members: [ExtensionMember]
}

enum ExtensionSpecialization {
    case inheritance(TypeInheritanceClause)
    case generic(GenericWhereClause)
}

enum ExtensionMember {
    case declaration(Declaration)
    case compilerStatement(CompilerControlStatement)
}
