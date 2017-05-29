import Foundation

indirect enum TypeIdentifier {
    case single(TypeName)
    case compound(TypeName, TypeIdentifier)
}

struct TypeName {
    let name: Identifier
    let genericArguments: GenericArgumentClause?
}
