//
//  PlaygroundViewModel.swift
//  StructuredConcurrency

import Foundation
import SwiftUI

@MainActor
public final class PlaygroundViewModel: ObservableObject {
    enum PlaygroundError: Error {
        case stop
    }

    private let duration: Int = 5
    @Published var curiosity: Int = 0
    @Published var opportunity: Int = 0
    @Published var spirit: Int = 0
    @Published var stopper: Bool = false
    @Published var errorMessage: String = ""

    func runTasksSerially() async throws {
        stopper = false
        for _ in 0 ..< duration {
            do {
                try Task.checkCancellation()
                if stopper {
                    throw PlaygroundError.stop
                }
                curiosity = try await getRandomNumber(sleepSeconds: 1)
                opportunity = try await getRandomNumber(sleepSeconds: 1)
                spirit = try await getRandomNumber(sleepSeconds: 1)
            } catch {
                spirit = 0
                opportunity = 0
                curiosity = 0
                errorMessage = "Serial tasks are cancelled"
            }
        }
    }

    func runTasksConcurrently() async throws {
        do {
            stopper = false
            try await withThrowingTaskGroup(of: Void.self) { group in
                for _ in 0 ..< duration {
                    try Task.checkCancellation()
                    if stopper {
                        throw PlaygroundError.stop
                    }
                    group.addTask {
                        try await self.setRandomNumberToSpirit(sleepSeconds: 1)
                    }
                    group.addTask {
                        try await self.setRandomNumberToCuriosity(sleepSeconds: 1)
                    }
                    group.addTask {
                        try await self.setRandomNumberToOpportunity(sleepSeconds: 1)
                    }
                    try await group.waitForAll()
                }
            }
        } catch {
            spirit = 0
            opportunity = 0
            curiosity = 0
            errorMessage = "Concurrent tasks are cancelled"
        }
    }
}

extension PlaygroundViewModel {
    private func setRandomNumberToCuriosity(sleepSeconds: Int) async throws {
        errorMessage = ""
        try await Task.sleep(nanoseconds: UInt64(sleepSeconds) * 1_000_000_000)
        // Sleeping in order to make it asynchronous
        curiosity = Int.random(in: 1 ... 12)
    }

    private func setRandomNumberToOpportunity(sleepSeconds: Int) async throws {
        errorMessage = ""
        try await Task.sleep(nanoseconds: UInt64(sleepSeconds) * 1_000_000_000)
        // Sleeping in order to make it asynchronous
        opportunity = Int.random(in: 1 ... 12)
    }

    private func setRandomNumberToSpirit(sleepSeconds: Int) async throws {
        errorMessage = ""
        try await Task.sleep(nanoseconds: UInt64(sleepSeconds) * 1_000_000_000)
        // Sleeping in order to make it asynchronous
        spirit = Int.random(in: 1 ... 12)
    }

    private func getRandomNumber(sleepSeconds: Int) async throws -> Int {
        errorMessage = ""
        try await Task.sleep(nanoseconds: UInt64(sleepSeconds) * 1_000_000_000)
        // Sleeping in order to make it asynchronous
        return Int.random(in: 1 ... 12)
    }
}
