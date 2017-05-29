import Foundation

struct AvailabilityCondition {
    let arguments: [AvailabilityArgument]
    
    init(argument: AvailabilityArgument, rest: [AvailabilityArgument]) {
        arguments = [argument] + rest
    }
}

enum AvailabilityArgument {
    case wildcard
    case specific(PlatformName, PlatformVersion)
}

enum PlatformName {
    case iOS, iOSApplicationExtension­
    case macOS­, macOSApplicationExtension­
    case watchOS
    case tvOS
}

struct PlatformVersion {
    let text: String
}
