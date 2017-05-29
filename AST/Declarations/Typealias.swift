import Foundation

struct TypealiasDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let name: Identifier
    let genericArguments: GenericArgumentClause?
    let type: Type
}
