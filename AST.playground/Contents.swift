//: Playground - noun: a place where people can play

import Cocoa

struct AST {
    let declarations: [Statement]
}

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

extension Statement {
    var isExpression: Bool {
        if case .expression = self { return true }
        else { return false }
    }
    
    var isDeclaration: Bool {
        if case .declaration = self { return true }
        else { return false }
    }
    
    var isLoopStatement: Bool {
        if case .loop = self { return true }
        else { return false }
    }
    
    var isBranchStatement: Bool {
        if case .branch = self { return true }
        else { return false }
    }
    
    var isLabeledStatement: Bool {
        if case .labeled = self { return true }
        else { return false }
    }
    
    var isControlTransferStatement: Bool {
        if case .controlTransfer = self { return true }
        else { return false }
    }
    
    var isDeferStatement: Bool {
        if case .defer = self { return true }
        else { return false }
    }
    
    var isDoStatement: Bool {
        if case .do = self { return true }
        else { return false }
    }
    
    var isCompilerControlStatement: Bool {
        if case .compilerControl = self { return true }
        else { return false }
    }
}

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

struct ConstantDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let initializers: PatternInitializerList
}

struct PatternInitializerList {
    let initializers: [(Pattern, Initializer?)]
    
    init(head: (Pattern, Initializer?), tail: [(Pattern, Initializer?)]) {
        initializers = [head] + tail
    }
}

struct Initializer {
    let expression: Expression
}

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

enum VariableDeclaration {
    case patterInitializer(PatternInitializerList)
    case computed(ComputedVariableDeclaration)
    case geterSetter(GetterSetterVariableDeclaration)
    case willSetDidSet(WillSetDidSetVariableDeclaration)
    case `protocol`(ProtocolVariableDeclaration)
}

struct ComputedVariableDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let type: TypeAnnotation
    let code: CodeBlock
}

struct GetterSetterVariableDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let type: TypeAnnotation
    let getter: GetterBlock
    let setter: SetterBlock?
}

struct GetterBlock {
    let attributes: [Attribute]
    let mutation: MutationModifier?
    let code: CodeBlock
}

struct SetterBlock {
    let attributes: [Attribute]
    let mutation: MutationModifier?
    let setterName: Identifier?
    let code: CodeBlock
}

struct ProtocolVariableDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let type: TypeAnnotation
    let getter: GetterKeywordClause
    let setter: SetterKeywordClause?
}

struct GetterKeywordClause {
    let attributes: [Attribute]
    let mutation: MutationModifier?
}

struct SetterKeywordClause {
    let attributes: [Attribute]
    let mutation: MutationModifier?
}

struct WillSetDidSetVariableDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    
    /// At least one of two must be non nil.
    let type: TypeAnnotation?
    let initializer: Initializer?
    
    let willSet: WillSetClause?
    let didSetClause: DidSetClause?
}

struct WillSetClause {
    let attributes: [Attribute]
    let newValueName: Identifier?
    let code: CodeBlock
}

struct DidSetClause {
    let attributes: [Attribute]
    let oldValueName: Identifier?
    let code: CodeBlock
}

struct TypeAnnotation {
    let attributes: [Attribute]
    let `inout`: Inout?
    let type: Type
}

enum Inout { case `inout` }

struct CodeBlock {
    let statements: [Statement]
}

struct TypealiasDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let name: Identifier
    let genericArguments: GenericArgumentClause?
    let type: Type
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

struct FunctionDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: FunctionName
    let genericParamters: GenericParameterClause?
    let parameters: [Parameter]
    let throwBehavior: ThrowsModifier?
    let result: FunctionResult?
    let `where`: GenericWhereClause?
    let body: CodeBlock?
}

enum FunctionName {
    case identifier(Identifier)
    case `operator`(Operator)
}

struct Parameter {
    let externalName: Identifier?
    let localName: Identifier
    let type: TypeAnnotation
    let modifier: ParameterModifier?
}

enum ParameterModifier {
    case `default`(Expression)
    case ellipsis
}

enum ThrowsModifier {
    case `throws`, `rethrows`
}

struct FunctionResult {
    let attributes: [Attribute]
    let type: Type
}

enum EnumDeclaration {
    case union(UnionEnumDeclaration)
    case raw(RawEnumDeclaration)
}

struct UnionEnumDeclaration {
    let indirect: Indirect?
    let name: Identifier
    let genericParameters: GenericParameterClause?
    let typeInheritance: TypeInheritanceClause?
    let genericConstraints: GenericWhereClause?
    let members: [UnionEnumMember]
}

enum UnionEnumMember {
    case `case`(UnionEnumCaseClause)
    case declaration(Declaration)
    case compilerControl(CompilerControlStatement)
}

struct UnionEnumCaseClause {
    let attributes: [Attribute]
    let indirect: Indirect?
    let cases: [UnionEnumCase]
}

struct UnionEnumCase {
    let name: Identifier
    let type: TupleType
}

struct RawEnumDeclaration {
    let name: Identifier
    let genericParameters: GenericParameterClause?
    let typeInheritance: TypeInheritanceClause
    let genericConstraints: GenericWhereClause?
    let members: [RawEnumMember]
}

enum RawEnumMember {
    case `case`(RawEnumCaseClause)
    case declaration(Declaration)
    case compilerControl(CompilerControlStatement)
}

struct RawEnumCaseClause {
    let attributes: [Attribute]
    let cases: [RawEnumCase]
}

struct RawEnumCase {
    let name: Identifier
    let rawValue: RawValueLiteral?
}

enum RawValueLiteral {
    case numeric(NumericLiteral)
    case string(StaticStringLiteral)
    case boolean(BooleanLiteral)
}

enum Indirect { case indirect }

struct StructDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let name: Identifier
    let genericParameters: GenericParameterClause?
    let typeInheritance: TypeInheritanceClause?
    let genericConstraints: GenericWhereClause?
    let members: [StructMember]
}

enum StructMember {
    case declaration(Declaration)
    case compilerStatement(CompilerControlStatement)
}

struct ClassDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let final: Final?
    let name: Identifier
    let genericParameters: GenericParameterClause?
    let typeInheritance: TypeInheritanceClause?
    let genericConstraints: GenericWhereClause?
    let members: [ClassMember]
}

enum Final { case final }

enum ClassMember {
    case declaration(Declaration)
    case compilerStatement(CompilerControlStatement)
}

struct ProtocolDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let name: Identifier
    let typeInheritance: TypeInheritanceClause?
    let members: [ProtocolMember]
}

enum ProtocolMember {
    case `var`(ProtocolPropertyDeclaration)
    case `func`(ProtocolMethodDeclaration)
    case `init`(ProtocolInitializerDeclaration)
    case `subscript`(ProtocolSubscriptDeclaration)
    case `associatedtype`(ProtocolAssociatedTypeDeclaration)
    case `typealias`(TypealiasDeclaration)
    
    case compilerStatement(CompilerControlStatement)
}

struct ProtocolPropertyDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let type: TypeAnnotation
    let getter: GetterKeywordClause
    let setter: SetterKeywordClause?
}

struct ProtocolMethodDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let name: Identifier
    let genericParameters: GenericParameterClause?
    let parameters: [Parameter]
    let throwBehavior: ThrowsModifier?
    let result: FunctionResult?
    let `where`: GenericWhereClause?
}

struct ProtocolInitializerDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let optionalModifier: InitializerOptionalKind?
    let genericParamters: GenericParameterClause?
    let parameters: [Parameter]
    let throwBehavior: ThrowsModifier?
    let `where`: GenericWhereClause?
}

struct ProtocolSubscriptDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let parameters: [Parameter]
    let result: FunctionResult
    let getter: GetterKeywordClause
    let setter: SetterKeywordClause
}

struct ProtocolAssociatedTypeDeclaration {
    let attributes: [Attribute]
    let accessLevel: AccessLevelModifier?
    let name: Identifier
    let typeInheritance: TypeInheritanceClause?
    let type: Type?
}


struct InitializerDeclaration {
    let attributes: [Attribute]
    let modifiers: [DeclarationModifier]
    let optionalModifier: InitializerOptionalKind?
    let genericParamters: GenericParameterClause?
    let parameters: [Parameter]
    let throwBehavior: ThrowsModifier?
    let `where`: GenericWhereClause?
    let code: CodeBlock
}

enum InitializerOptionalKind {
    case optional
    case implicit
}


struct DeinitializerDeclaration {
    let attributes: [Attribute]
    let code: CodeBlock
}

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

struct ExtensionDeclaration {
    let attributes: [Attribute]
    let accessModifier: AccessLevelModifier?
    let type: Identifier
    let specialization: ExtensionSpecialization?
    let members: [ExtensionMember]
}

enum ExtensionSpecialization {
    case inheritance(TypeInheritanceClause)
    case generic(GenericWhereClause)
}

enum ExtensionMember {
    case declaration(Declaration)
    case compilerStatement(CompilerControlStatement)
}

enum OperatorDeclaration {
    case prefix(Operator)
    case postfix(Operator)
    case infix(Operator, Identifier?)
}

struct PrecedenceGroupDeclaration {
    let name: Identifier
    let attributes: [PrecedenceGroupAttribute]
}

enum PrecedenceGroupAttribute {
    case relation(PrecedenceGroupRelation)
    case assignement(BooleanLiteral)
    case associativity(PrecedenceGroupAssociativity)
}

enum PrecedenceGroupRelation {
    case higherThan(PrecedenceGroupNames)
    case lowerThan(PrecedenceGroupNames)
}

enum PrecedenceGroupAssociativity {
    case left
    case right
    case none
}

struct PrecedenceGroupNames {
    let names: [Identifier]
    
    init(head: Identifier, rest: [Identifier]) {
        names = [head] + rest
    }
}

struct LoopStatement {}
struct BranchStatement {}
struct LabeledStatement {}
struct ControlTransferStatement {}
struct DeferStatement {}
struct DoStatement {}
struct CompilerControlStatement {}

// Lower level
struct Expression {}
struct Attribute {}
struct ImportPathIdentifier {}
struct Pattern {}
struct Identifier {}
struct GenericArgumentClause {}
struct Type {}
struct GenericWhereClause {}
struct GenericParameterClause {}
struct Operator {}
struct NumericLiteral {}
struct StaticStringLiteral {}
struct BooleanLiteral {}
struct TupleType {}
struct TypeInheritanceClause {}



func numberOfIfs(in ast: AST) -> Int {
    return ast.declarations.filter { $0.isBranchStatement }.count
}
