//
//  SpacesConfig.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
import SwiftUI

struct DesignConfig {
    enum CornerRadius {
        static let standard: CGFloat = 10
        static let small: CGFloat = 8
    }

    enum Spaces {
        static let xxsmallSpace: CGFloat = 10
        static let xsmallSpace: CGFloat = 15
        static let smallSpace: CGFloat = 20
        static let mediumSpace: CGFloat = 24
        static let additionalSpace: CGFloat = 34
        static let largeSpace: CGFloat = 68
        static let navigationTopSpace: CGFloat = 53
        static let navigationLeadingSpace: CGFloat = 27
    }

    enum ShadowAdjustments {
        static let black: Color = .black
        static let color: Color = .gray
        static let xPosition: CGFloat = 3
        static let yPosition: CGFloat = 3
        static let radius: CGFloat = 3
    }
}
