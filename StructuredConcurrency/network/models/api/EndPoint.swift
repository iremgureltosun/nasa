//
//  Endpoint.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation

struct URLRequestManager {
    static func getUrlRequestPath(searchCriteria: SearchCriteria, startDate: String? = nil, endDate: String? = nil, method: HttpMethod = .get) throws -> URLRequest {
        let urlText = APIConfig.getSearchURL(searchCriteria: searchCriteria, startDate: startDate, endDate: endDate)
        guard urlText != "", let url = URL(string: urlText) else {
            throw EndPointError.urlFailure
        }
        print("Url of the endpoint is : \(url)")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.name
        return urlRequest
    }
}
