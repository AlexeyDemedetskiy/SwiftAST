import Foundation

enum LoopStatement {
    case `for`(ForStatement)
    case `while`(WhileStatement)
    case `repeat`(RepeatStatement)
}

struct ForStatement {
    let `case`: Bool
    let pattern: Pattern
    let expression: Expression
    let `where`: Expression?
    let code: CodeBlock
}

struct WhileStatement {
    let condtions: ConditionList
    let code: CodeBlock
}

struct ConditionList {
    let conditions: [Condition]
    
    init(head: Condition, rest: [Condition]) {
        conditions = [head] + rest
    }
}

enum Condition {
    case expression(Expression)
    case availability(AvailabilityCondition)
    case `case`(CaseCondition)
    case binding(OptionalBindingCondition)
}

struct CaseCondition {
    let pattern: Pattern
    let initializer: Initializer
}

struct OptionalBindingCondition {
    let kind: Kind
    let pattern: Pattern
    let initializer: Initializer
    
    enum Kind { case `let`, `var` }
}

struct RepeatStatement {
    let code: CodeBlock
    let `while`: Expression
}

