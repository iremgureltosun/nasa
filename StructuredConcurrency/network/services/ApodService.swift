//
//  SearchNewsService.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation

protocol ApodServiceProtocol {
    func performRequest() async throws -> ApodResponse?
}

final class ApodService: BaseSearchService<ApodResponse>, ApodServiceProtocol {}
