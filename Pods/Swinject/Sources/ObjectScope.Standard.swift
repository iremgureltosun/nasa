//
//  Copyright © 2019 Swinject Contributors. All rights reserved.
//

public extension ObjectScope {
    /// A new instance is always created by the ``Container`` when a type is resolved.
    /// The instance is not shared.
    static let transient = ObjectScope(storageFactory: TransientStorage.init, description: "transient")

    /// Instances are shared only when an object graph is being created,
    /// otherwise a new instance is created by the ``Container``. This is the default scope.
    static let graph = ObjectScope(storageFactory: GraphStorage.init, description: "graph")

    /// An instance provided by the ``Container`` is shared within the ``Container`` and its child `Containers`.
    static let container = ObjectScope(storageFactory: PermanentStorage.init, description: "container")

    /// An instance provided by the ``Container`` is shared within the ``Container`` and its child ``Container``s
    /// as long as there are strong references to given instance. Otherwise new instance is created
    /// when resolving the type.
    static let weak = ObjectScope(storageFactory: WeakStorage.init, description: "weak",
                                  parent: ObjectScope.graph)
}
