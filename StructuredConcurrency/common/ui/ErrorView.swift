//
//  ErrorView.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import SwiftUI

struct CenteredLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: DesignConfig.Spaces.xsmallSpace) {
            configuration.icon
            configuration.title
        }
    }
}

struct ErrorView: View {
    var body: some View {
        Color.blue.ignoresSafeArea().overlay(
            Label("Error occured", systemImage: "bubbles.and.sparkles")
                .font(.title)
                .foregroundColor(.white)
                .labelStyle(CenteredLabelStyle())
        )
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
