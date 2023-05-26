//
//  ContainerBuilder.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
import Swinject

final class ContainerBuilder {
    static let shared = ContainerBuilder()
    func buildContainer() -> Container {
        let container = Container()

        // MARK: API for fetching news

        container.register(ApodServiceProtocol.self) { _ in
            ApodService()
        }.inObjectScope(.container)

        container.register(AsteroidServiceProtocol.self) { _ in
            AsteroidService()
        }.inObjectScope(.container)

        container.register(MarsPhotoServiceProtocol.self) { _ in
            MarsPhotoService()
        }.inObjectScope(.container)

        return container
    }
}
