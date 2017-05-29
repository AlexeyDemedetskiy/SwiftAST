import Foundation

struct ConstantDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let initializers: PatternInitializerList
}

struct PatternInitializerList {
    let initializers: [(Pattern, Initializer?)]
    
    init(head: (Pattern, Initializer?), tail: [(Pattern, Initializer?)]) {
        initializers = [head] + tail
    }
}

struct Initializer {
    let expression: Expression
}
