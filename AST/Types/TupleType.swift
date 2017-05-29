import Foundation

struct TupleType {
    let elements: [TupleTypeElement]
}

struct TupleTypeElement {
    let name: Identifier
    let attributes: [Attribute]
    let `inout`: Inout?
    let type: Type
}
