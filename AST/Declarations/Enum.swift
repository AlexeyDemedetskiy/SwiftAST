import Foundation

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
