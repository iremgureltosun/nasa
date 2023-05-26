//
//  RemoteImageView.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
import SwiftUI

struct RemoteImageView: View {
    private let url: String
    private let contentMode: ContentMode
    init(url: String, contentMode: ContentMode) {
        self.url = url
        self.contentMode = contentMode
    }

    var body: some View {
        let transaction = Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))
        AsyncImage(url: URL(string: url), transaction: transaction) { phase in

            // MARK: Success, failure and empty phases

            switch phase {
            case let .success(image):
                image.imageModifier(contentMode: contentMode)
                    .transition(.move(edge: .bottom))
            case .failure:
                Image(systemName: "globe.asia.australia.fill")
                    .iconModifier(error: true, contentMode: contentMode)
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier(contentMode: contentMode)
            @unknown default:
                ProgressView()
            }
        }
    }
}

struct TestImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView(url: "https://credo.academy/credo-academy@3x.png", contentMode: .fit)
    }
}
