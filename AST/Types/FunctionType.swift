import Foundation

struct FunctionType {
    let attributes: [Attribute]
    let arguments: FunctionTypeArgumentsList
    let throwModifier: ThrowsModifier?
    let result: Type
}


enum Ellipsis { case ellipsis }

struct FunctionTypeArgumentsList {
    let arguments: [FunctionTypeArgument]
    let ellipsis: Ellipsis?
    
    init() {
        arguments = []
        ellipsis = nil
    }
    
    init(argument: FunctionTypeArgument,
         rest: [FunctionTypeArgument],
         ellipsis: Ellipsis? = nil) {
        self.arguments = [argument] + rest
        self.ellipsis = ellipsis
    }
}

struct FunctionTypeArgument {
    let label: Identifier?
    let attributes: [Attribute]
    let `inout`: Inout?
    let type: Type
    
}
