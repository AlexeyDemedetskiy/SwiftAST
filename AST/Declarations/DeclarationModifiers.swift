import Foundation

enum DeclarationModifier {
    case `class`
    case `convinience`
    case `dynamic`
    case `final`
    case `infix`
    case `lazy`
    case `optional`
    case `override`
    case `postfix`
    case `prefix`
    case `required`
    case `static`
    case `unowned`
    case `unownedSafe`
    case `weak`
    case access(AccessLevelModifier)
    case mutation(MutationModifier)
}

enum AccessLevelModifier {
    case `private`, privateSet
    case `fileprivate`, fileprivateSet
    case `internal`, internalSet
    case `public`, publicSet
    case `open`, openSet
}

enum MutationModifier {
    case mutating
    case nonmutating
}
