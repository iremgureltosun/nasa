//
//  NewsViewModel.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
import SwiftUI

@MainActor
public final class SpaceViewModel: ObservableObject {
    @Inject private var apodService: ApodServiceProtocol
    @Inject private var asteroidService: AsteroidServiceProtocol
    @Inject private var marsPhotoService: MarsPhotoServiceProtocol

    @Published var isLoading: Bool = true
    @Published var viewState: ViewStates = .success
    @Published var apodResponse: ApodResponse?
    @Published var asteroidResponse: AsteroidsResponse?
    @Published var photoResponse: MarsPhotoResponse?
    @Published var detailViewModel: ApodDetailViewModel?
    @Published var apodTitle: String = ""
    public let asteroidsTitle: String = "Asteroids in Next 7 Days"
    public let marsPhotosTitle: String = "Photos from Mars"

    func fetchApod() async throws {
        do {
            // Fetching astronomy picture of today
            apodResponse = try await apodService.performRequest()
            apodTitle = "Astronomy Picture of the Day"
        } catch {
            viewState = .error
        }
    }

    func fetchAsteroids() async throws {
        do {
            // Fetching near earth Asteroid information
            let today = Date()
            let calendar = Calendar.current
            if let endDate = calendar.date(byAdding: .day, value: 7, to: today) {
                asteroidResponse = try await asteroidService.performRequest(startDate: today.toString(), endDate: endDate.toString())
            }
        } catch {
            viewState = .error
        }
    }

    func getRandomMarsPhotos() async throws {
        let today = Date()
        let calendar = Calendar.current
        if let startDate = calendar.date(byAdding: .day, value: -3000, to: today) {
            if let date = generateRandomDate(startDate: startDate, endDate: today) {
                photoResponse = try await marsPhotoService.performRequest(startDate: date.toString())
            }
        }
    }

    private func generateRandomDate(startDate: Date, endDate: Date) -> Date? {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: startDate)
        let end = calendar.startOfDay(for: endDate)

        let timeInterval = end.timeIntervalSince(start)
        guard timeInterval > 0 else {
            return nil
        }

        let randomTimeInterval = TimeInterval(arc4random_uniform(UInt32(timeInterval)))
        let randomDate = start.addingTimeInterval(randomTimeInterval)

        return randomDate
    }

    func openDetail() {
        detailViewModel = ApodDetailViewModel(imageUrl: apodResponse?.url ?? "", title: apodResponse?.title ?? "", description: apodResponse?.explanation ?? "")
    }
}
