//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation

protocol AdessoResponseProtocol: Decodable {
    associatedtype AdessoType
    static func getRequestUrl(startDate: String?, endDate: String?) throws -> URLRequest?
}

class RequestObservable<T> where T: AdessoResponseProtocol {
    typealias AdessoType = T.Type

    private lazy var jsonDecoder = JSONDecoder()
    var urlSession: URLSession
    init(config _: URLSessionConfiguration) {
        urlSession = URLSession(configuration:
            URLSessionConfiguration.default)
    }

    func callAPI<T: AdessoResponseProtocol>(startDate: String? = nil, endDate: String? = nil) async throws -> T {
        guard let urlRequest = try T.getRequestUrl(startDate: startDate, endDate: endDate) else {
            throw APIError.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.invalidResponse(HttpStatusCode.ClientError.badRequest)
        }

        guard HttpStatusCode.Success.range.contains(httpResponse.statusCode) else {
            throw HTTPError.invalidResponse(httpResponse.statusCode)
        }

        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            throw APIError.decodingFailed
        }
    }
}
