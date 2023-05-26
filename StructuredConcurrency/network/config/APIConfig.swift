//
//  File.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation

struct APIConfig {
    public static let baseURL = "https://api.nasa.gov/planetary/"
    public static let asteroidURL = "https://api.nasa.gov/neo/rest/v1/feed?"
    public static let marsPhotosURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&"
    public static let apiKey_nasa = "k9Z9ZsGpztz5lifC5nbLG1z8JerYnp0PWhbuINt7"

    static func getSearchURL(searchCriteria: SearchCriteria, startDate: String?, endDate: String?) -> String {
        switch searchCriteria {
        case .apod:
            return "\(baseURL)apod?api_key=\(apiKey_nasa)"
        case .astreoids:
            return "\(asteroidURL)start_date=\(startDate ?? "")&end_date=\(endDate ?? "")&api_key=\(apiKey_nasa)"
        case .marsPhoto:
            return "\(marsPhotosURL)earth_date=\(startDate ?? "")&api_key=\(apiKey_nasa)&page=1"
        }
    }
}
