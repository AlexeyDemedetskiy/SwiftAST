import Foundation

struct SubscriptDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let parameters: [Parameter]
    let result: FunctionResult
    let body: SubscriptBody
}

enum SubscriptBody {
    case code(CodeBlock)
    case getterSetter(GetterBlock, SetterBlock?)
    case getterSetterKeyword(GetterKeywordClause, SetterKeywordClause?)
}
