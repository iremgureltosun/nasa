//
//  AsteriodsViewModel.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import Foundation
import SwiftUI

@MainActor
public final class AsteroidsViewModel: ObservableObject {
    @Published var selectedDate: String
    @Published var nearEarthObjects: [String: NearEarthObject]

    init(selectedDate: String, nearEarthObjects: [String: NearEarthObject]) {
        self.selectedDate = selectedDate
        self.nearEarthObjects = nearEarthObjects
    }
}
