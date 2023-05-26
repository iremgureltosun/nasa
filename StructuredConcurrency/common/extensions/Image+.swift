//
//  Image+.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
import SwiftUI

extension Image {
    func imageModifier(contentMode: ContentMode) -> some View {
        resizable()
            .aspectRatio(contentMode: contentMode)
    }

    func iconModifier(error: Bool = false, contentMode: ContentMode) -> some View {
        imageModifier(contentMode: contentMode)
            .foregroundColor((error == false) ? Color.purple : Color.red)
            .opacity(0.5)
    }
}
