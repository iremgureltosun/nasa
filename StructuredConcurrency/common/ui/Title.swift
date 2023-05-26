//
//  TitleView.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import SwiftUI

struct Title: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color.primary)
            .fontWeight(.bold)
            .font(Font.custom(FontsConfig.Fonts.bold, size: FontsConfig.FontSizes.large))
    }
}

struct SmallSubtitle: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color.primary)
            .font(Font.custom(FontsConfig.Fonts.regular, size: FontsConfig.FontSizes.small))
            .opacity(0.6)
    }
}

struct MediumSubtitle: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.secondary)
            .font(Font.custom(FontsConfig.Fonts.regular, size: FontsConfig.FontSizes.medium))
    }
}

struct BoldTitle: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color.primary)
            .font(Font.custom(FontsConfig.Fonts.bold, size: FontsConfig.FontSizes.medium3))
    }
}

struct RegularSubtitle: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.secondary)
            .font(Font.custom(FontsConfig.Fonts.regular, size: FontsConfig.FontSizes.medium))
    }
}
