import Foundation

enum OperatorDeclaration {
    case prefix(Operator)
    case postfix(Operator)
    case infix(Operator, Identifier?)
}
