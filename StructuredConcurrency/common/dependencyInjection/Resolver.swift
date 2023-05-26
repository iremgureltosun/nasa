//
//  Resolver.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation

final class Resolver {
    static let shared = Resolver()
    private let container = ContainerBuilder.shared.buildContainer()

    func resolve<T>(_: T.Type) -> T {
        container.resolve(T.self)!
    }
}
