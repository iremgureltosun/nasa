//
//  Copyright © 2019 Swinject Contributors. All rights reserved.
//

// MARK: For auto migration from Swinject v1 to v2.

public extension ObjectScope {
    @available(*, unavailable, renamed: "transient")
    static let none = transient

    @available(*, unavailable, renamed: "container")
    static let hierarchy = container
}

@available(*, unavailable, renamed: "Resolver")
public protocol ResolverType {}

@available(*, unavailable, renamed: "Assembly")
public protocol AssemblyType {}

@available(*, unavailable, renamed: "ServiceKeyOption")
public protocol ServiceKeyOptionType {}
