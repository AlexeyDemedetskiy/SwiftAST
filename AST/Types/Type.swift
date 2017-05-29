import Foundation

indirect enum Type {
    case array(ArrayType)
    case dictionary(DictionaryType)
    case function(FunctionType)
    case identifier(TypeIdentifier)
    case tuple(TupleType)
    case optional(OptionalType)
    case implicitlyUnwrapped(ImplicitlyUnwrappedOptionalType)
    case protocolComposition(ProtocolCompositionType)
    case meta(Metatype)
    case any
    case `self`
    case parenthesis(Type)
}

enum Inout { case `inout` }

struct TypeAnnotation {
    let attributes: [Attribute]
    let `inout`: Inout?
    let type: Type
}
