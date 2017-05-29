import Foundation

enum BranchStatement {
    case `if`(IfStatement)
    case `guard`(GuardStatement)
    case `switch`(SwitchStatement)
}

struct IfStatement {
    let conditions: ConditionList
    let code: CodeBlock
    let `else`: ElseClause?
}

indirect enum ElseClause {
    case code(CodeBlock)
    case `if`(IfStatement)
}

struct GuardStatement {
    let conditions: ConditionList
    let code: CodeBlock
}

struct SwitchStatement {
    let expression: Expression
    let cases: [SwitchCase]
}

enum SwitchCase {
    case `case`(CaseItemList)
    case `default`
}

indirect enum CaseItemList {
    case item(CaseItem)
    case list(CaseItem, CaseItemList)
}

struct CaseItem {
    let pattern: Pattern
    let `where`: Expression
}

