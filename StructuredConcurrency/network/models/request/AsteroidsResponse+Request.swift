//
//  AsteroidsResponse+Request.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 15.05.2023.
//

import Foundation

extension AsteroidsResponse {
    static func getRequestUrl(startDate: String?, endDate: String?) throws -> URLRequest? {
        return try URLRequestManager.getUrlRequestPath(searchCriteria: .astreoids, startDate: startDate, endDate: endDate)
    }
}
