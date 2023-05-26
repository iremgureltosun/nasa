//
//
//  Created by Tosun, Irem on 29.11.2022.
//

import Foundation
import UIKit

class BaseSearchService<T> where T: AdessoResponseProtocol {
    typealias AdessoType = T.Type
    let session: URLSession
    lazy var requestObservable = RequestObservable<T>(config: .default)
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func performRequest<T: AdessoResponseProtocol>(startDate: String?, endDate: String?) async throws -> T? {
        return try await requestObservable.callAPI(startDate: startDate, endDate: endDate)
    }

    func performRequest<T: AdessoResponseProtocol>(startDate: String?) async throws -> T? {
        return try await requestObservable.callAPI(startDate: startDate)
    }

    func performRequest<T: AdessoResponseProtocol>() async throws -> T? {
        return try await requestObservable.callAPI()
    }
}
