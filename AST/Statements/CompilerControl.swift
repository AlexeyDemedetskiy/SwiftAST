import Foundation

enum CompilerControlStatement {
    case conditionalCompilation(ConditionalCompilationBlock)
    case lineControl(LineControlStatement)
}

struct ConditionalCompilationBlock {
    let `if`: Derictive
    let elseif: [Derictive]
    let `else`: [Statement]
}

struct Derictive {
    let condition: CompilationCondition
    let code: [Statement]
}

indirect enum CompilationCondition {
    case platform(PlatformCondition)
    case identifier(Identifier)
    case boolean(BooleanLiteral)
    case parenthesis(CompilationCondition)
    case not(CompilationCondition)
    case and(CompilationCondition, CompilationCondition)
    case or(CompilationCondition, CompilationCondition)
}

enum PlatformCondition {
    case os(OperatingSystem)
    case arch(Architecture)
    case swift(SwiftVersion)
}

enum OperatingSystem {
    case macOS, iOS, tvOS, watchOS
}

enum Architecture {
    case i386, x86_64, arm, arm64
}

struct SwiftVersion {
    let version: String
}

struct LineControlStatement {
    let file: String
    let line: UInt
}
