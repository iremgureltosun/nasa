//
//  APIError.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
enum APIError: Error {
    case timeout
    case emptyResponse
    case invalidUrl
    case decodingFailed
}
