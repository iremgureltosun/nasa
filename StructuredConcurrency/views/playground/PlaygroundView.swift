//
//  PlaygroundView.swift
//  StructuredConcurrency

import SwiftUI

struct PlaygroundView: View {
    @ObservedObject private var viewModel: PlaygroundViewModel
    @State private var buttonDisabled: Bool = false

    init(viewModel: PlaygroundViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            VStack(spacing: DesignConfig.Spaces.mediumSpace) {
                Button("Run each capsule concurrently") {
                    Task {
                        buttonDisabled = true
                        try await viewModel.runTasksConcurrently()
                        buttonDisabled = false
                    }
                }.disabled(buttonDisabled)

                HStack(spacing: DesignConfig.Spaces.mediumSpace) {
                    Button("Run each capsule serially") {
                        Task {
                            buttonDisabled = true
                            try await self.viewModel.runTasksSerially()
                            buttonDisabled = false
                        }
                    }
                }.disabled(buttonDisabled)

                HStack {
                    updateImage(String(viewModel.curiosity))

                    updateImage(String(viewModel.opportunity))

                    updateImage( String(viewModel.spirit))
                }
                MediumSubtitle(text: viewModel.errorMessage).foregroundColor(.red)

                LineView()
                Button("Stop") {
                    Task {
                        self.viewModel.stopper = true
                        self.buttonDisabled = false
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {}
    }

    @ViewBuilder
    private func updateImage(_ imageNo: String) -> some View {
      Image("Image \(imageNo)")
            .resizable()
            .frame(width: 60, height: 60)
    }
}
