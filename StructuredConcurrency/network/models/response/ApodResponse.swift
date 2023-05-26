//
//  File.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
import SwiftUI

struct ApodResponse: AdessoResponseProtocol {
    typealias AdessoType = ApodResponse

    let date, explanation: String
    let hdurl: String
    let mediaType, serviceVersion, title: String
    let url: String

    var shortExplanation: String {
        return (explanation.count > 250) ? String(explanation.prefix(250)) : explanation
    }

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
