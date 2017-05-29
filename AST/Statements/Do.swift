import Foundation

struct DoStatement {
    let code: CodeBlock
    let cathes: [CatchClause]
}

struct CatchClause {
    let pattern: Pattern?
    let `where`: Expression?
    let code: CodeBlock
}
