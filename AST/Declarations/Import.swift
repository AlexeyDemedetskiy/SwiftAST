import Foundation

struct ImportDeclaration {
    let attributes: [Attribute]
    let importKind: ImportKind?
    let importPath: ImportPath
}

enum ImportKind {
    case `typealias`
    case `struct`
    case `class`
    case `enum`
    case `protocol`
    case `var`
    case `func`
}

struct ImportPath {
    let identifiers: [ImportPathIdentifier]
    
    init(head: ImportPathIdentifier, tail: [ImportPathIdentifier]) {
        identifiers = [head] + tail
    }
}
