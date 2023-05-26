//
//  FontsConfig.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
struct FontsConfig {
    enum Fonts {
        static let bold: String = "SF-Pro-Display-Bold"
        static let semibold: String = "SF-Pro-Display-SemiBold"
        static let regular: String = "SF-Pro-Display-Regular"
        static let black: String = "SF-Pro-Display-Black"
        static let medium: String = "SF-Pro-Display-Medium"
    }

    enum FontSizes {
        static let xLarge: CGFloat = 34
        static let large: CGFloat = 25

        static let medium4: CGFloat = 22
        static let medium3: CGFloat = 20
        static let medium2: CGFloat = 18

        static let medium: CGFloat = 15
        static let small: CGFloat = 12
        static let xsmall: CGFloat = 10
    }
}
