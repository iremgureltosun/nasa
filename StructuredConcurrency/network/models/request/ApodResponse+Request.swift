//
//  ApodResponse+Request.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 15.05.2023.
//

import Foundation

extension ApodResponse {
    static func getRequestUrl(startDate: String?, endDate: String?) throws -> URLRequest? {
        return try URLRequestManager.getUrlRequestPath(searchCriteria: .apod, startDate: startDate, endDate: endDate)
    }

    static func getRequestUrl() throws -> URLRequest? {
        return nil
    }
}
