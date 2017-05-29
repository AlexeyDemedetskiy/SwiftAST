import Foundation

struct LabeledStatement {
    let label: Expression
    let statement: LabelableStatement
}

enum LabelableStatement {
    case loop(LoopStatement)
    case `if`(IfStatement)
    case `switch`(SwitchStatement)
    case `do`(DoStatement)
}
