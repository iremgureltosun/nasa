//
//  AsteroidService.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 15.05.2023.
//

import Foundation

protocol AsteroidServiceProtocol {
    func performRequest(startDate: String?, endDate: String?) async throws -> AsteroidsResponse?
}

final class AsteroidService: BaseSearchService<AsteroidsResponse>, AsteroidServiceProtocol {}
