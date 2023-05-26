//
//  HTTPError.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation

public enum HTTPError: Equatable {
    case statusCode(Int)
    case invalidResponse(Int)
    case notFoundResponse
}

extension HTTPError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response"
        case .notFoundResponse:
            return "Not found"
        case let .statusCode(int):
            return String(int)
        }
    }
}
