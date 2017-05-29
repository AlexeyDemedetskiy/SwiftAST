import Foundation

enum Declaration {
    case `import`(ImportDeclaration)
    case constant(ConstantDeclaration)
    case variable(VariableDeclaration)
    case `typealias`(TypealiasDeclaration)
    case function(FunctionDeclaration)
    case `enum`(EnumDeclaration)
    case `struct`(StructDeclaration)
    case `class`(ClassDeclaration)
    case `protocol`(ProtocolDeclaration)
    case initializer(InitializerDeclaration)
    case deinitializer(DeinitializerDeclaration)
    case `extension`(ExtensionDeclaration)
    case `subscript`(SubscriptDeclaration)
    case `operator`(OperatorDeclaration)
    case precedenceGroup(PrecedenceGroupDeclaration)
}

