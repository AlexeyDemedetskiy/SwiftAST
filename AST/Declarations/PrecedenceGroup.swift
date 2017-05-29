import Foundation

struct PrecedenceGroupDeclaration {
    let name: Identifier
    let attributes: [PrecedenceGroupAttribute]
}

enum PrecedenceGroupAttribute {
    case relation(PrecedenceGroupRelation)
    case assignement(BooleanLiteral)
    case associativity(PrecedenceGroupAssociativity)
}

enum PrecedenceGroupRelation {
    case higherThan(PrecedenceGroupNames)
    case lowerThan(PrecedenceGroupNames)
}

enum PrecedenceGroupAssociativity {
    case left
    case right
    case none
}

struct PrecedenceGroupNames {
    let names: [Identifier]
    
    init(head: Identifier, rest: [Identifier]) {
        names = [head] + rest
    }
}
