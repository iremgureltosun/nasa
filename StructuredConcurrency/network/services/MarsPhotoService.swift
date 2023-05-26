//
//  MarsPhotoService.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import Foundation

protocol MarsPhotoServiceProtocol {
    func performRequest(startDate: String?) async throws -> MarsPhotoResponse?
}

final class MarsPhotoService: BaseSearchService<MarsPhotoResponse>, MarsPhotoServiceProtocol {}
