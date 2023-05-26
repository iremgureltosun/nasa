//
//  HttpStatusCode.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
struct HttpStatusCode {
    enum Informational {
        static let range = 100 ..< 200
    }

    enum Success {
        static let range = 200 ..< 300
    }

    enum Redirection {
        static let range = 300 ..< 400
    }

    enum ClientError {
        static let range = 400 ..< 500
        static let badRequest = 400
        static let notFoundError = 401
    }

    enum ServerError {
        static let range = 500 ..< 600
    }
}
