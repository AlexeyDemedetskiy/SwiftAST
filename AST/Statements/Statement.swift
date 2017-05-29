import Foundation

enum Statement {
    case expression(Expression)
    case declaration(Declaration)
    case loop(LoopStatement)
    case branch(BranchStatement)
    case labeled(LabeledStatement)
    case controlTransfer(ControlTransferStatement)
    case `defer`(DeferStatement)
    case `do`(DoStatement)
    case compilerControl(CompilerControlStatement)
}
