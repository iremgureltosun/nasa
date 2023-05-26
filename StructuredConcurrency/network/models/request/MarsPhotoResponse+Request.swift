//
//  MarsPhotoResponse+Request.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import Foundation

extension MarsPhotoResponse {
    static func getRequestUrl(startDate: String?, endDate: String?) throws -> URLRequest? {
        return try URLRequestManager.getUrlRequestPath(searchCriteria: .marsPhoto, startDate: startDate, endDate: endDate)
    }
}
