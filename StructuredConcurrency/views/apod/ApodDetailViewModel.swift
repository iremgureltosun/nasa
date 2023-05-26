//
//  ApodDetailViewModel.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import Foundation
import SwiftUI

@MainActor
public final class ApodDetailViewModel: ObservableObject {
    @Published var imageUrl: String
    @Published var title: String
    @Published var description: String

    init(imageUrl: String, title: String, description: String) {
        self.imageUrl = imageUrl
        self.title = title
        self.description = description
    }
}
