//
//  MarsPhotoResponse.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import Foundation

struct MarsPhotoResponse: AdessoResponseProtocol {
    typealias AdessoType = MarsPhotoResponse
    let photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case photos
    }
}

struct Photo: Codable, Identifiable {
    let id, sol: Int
    let camera: Camera
    let imgSrc: String
    let earthDate: String
    let rover: Rover

    enum CodingKeys: String, CodingKey {
        case id, sol, camera, rover
        case imgSrc = "img_src"
        case earthDate = "earth_date"
    }
}

struct Camera: Codable {
    let id: Int
    let name: String
    let roverID: Int
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

struct Rover: Codable {
    let id: Int
    let name, landingDate, launchDate, status: String

    enum CodingKeys: String, CodingKey {
        case id, name, status
        case landingDate = "landing_date"
        case launchDate = "launch_date"
    }
}
