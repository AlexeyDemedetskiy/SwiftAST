import Foundation

enum ControlTransferStatement {
    case `break`(BreakStatement)
    case `continue`(ContinueStatement)
    case `fallthrough`(FallthroughStatement)
    case `return`(ReturnStatement)
    case `throw`(ThrowStatement)
}

struct BreakStatement {
    let label: Identifier?
}

struct ContinueStatement {
    let label: Identifier?
}

struct FallthroughStatement {}

struct ReturnStatement {
    let expression: Expression?
}

struct ThrowStatement {
    let error: Expression
}
