//
//  NewsCoordinatorView.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import SwiftUI

struct SpaceView: View {
    @ObservedObject private var viewModel: SpaceViewModel

    init(viewModel: SpaceViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            if viewModel.viewState == .error {
                ErrorView()
            } else {
                if viewModel.isLoading {
                    ActivityIndicator(isAnimating: viewModel.isLoading) {
                        $0.color = .blue
                        $0.hidesWhenStopped = true
                    }
                } else {
                    NavigationView {
                        ScrollView {
                            VStack(alignment: .leading, spacing: DesignConfig.Spaces.mediumSpace) {
                                sectionMarsPhotos

                                Title(text: viewModel.apodTitle)
                                    .lineLimit(2)
                                sectionApod
                                    .onNavigation {
                                        viewModel.openDetail()
                                    }
                                    .navigation(item: $viewModel.detailViewModel) { detail in
                                        ApodDetailView(viewModel: detail)
                                    }

                                if let days = viewModel.asteroidResponse?.elementCount {
                                    Title(text: "\(viewModel.asteroidsTitle)  \(String(days))")
                                        .lineLimit(2)
                                }

                                sectionAsteroid
                            }
                            .padding(.horizontal, DesignConfig.Spaces.mediumSpace)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await withTaskGroup(of: Void.self) { group in

                    group.addTask {
                        Task {
                            try await viewModel.getRandomMarsPhotos()
                        }
                    }
                    group.addTask {
                        Task {
                            try await viewModel.fetchApod()
                        }
                    }
                    group.addTask {
                        Task {
                            try await viewModel.fetchAsteroids()
                        }
                    }

                    await group.waitForAll()
                    viewModel.isLoading = false
                }
            }
        }
    }

    @ViewBuilder
    private var sectionMarsPhotos: some View {
        if let photos = viewModel.photoResponse?.photos {
            VStack {
                Title(text: viewModel.marsPhotosTitle)
                    .lineLimit(2)
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(photos, id: \.id) { marsPhoto in
                            VStack {
                                RemoteImageView(url: marsPhoto.imgSrc, contentMode: .fit)
                                    .frame(width: 300, height: 280)
                                MediumSubtitle(text: "\(marsPhoto.earthDate) - \(marsPhoto.rover.name)")
                                SmallSubtitle(text: "Photos taken by \(marsPhoto.camera.fullName)")
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var sectionApod: some View {
        HStack(alignment: .top, spacing: DesignConfig.Spaces.mediumSpace) {
            if let responseApod = viewModel.apodResponse {
                RemoteImageView(url: responseApod.url, contentMode: .fit)
                    .frame(height: 180)

                VStack(alignment: .leading, spacing: DesignConfig.Spaces.smallSpace) {
                    Group {
                        BoldTitle(text: viewModel.apodResponse?.title ?? "")
                        RegularSubtitle(text: viewModel.apodResponse?.shortExplanation ?? "")
                    }
                    .multilineTextAlignment(.leading)

                    HStack {
                        Spacer()
                        Capsule()
                            .foregroundColor(.smokeBg)
                            .overlay {
                                SmallSubtitle(text: "More")
                            }
                            .frame(width: 70, height: 20)
                    }
                }.frame(height: 200)
            }
        }
    }

    @ViewBuilder
    private var sectionAsteroid: some View {
        VStack(alignment: .leading, spacing: DesignConfig.Spaces.smallSpace) {
            if let nearEarthObjects = viewModel.asteroidResponse?.nearEarthObjects {
                ForEach(Array(nearEarthObjects.keys.compactMap { $0.toDate() }.sorted()), id: \.self) { date in
                    HStack(alignment: .top) {
                        RegularSubtitle(text: date.toString())
                            .frame(width: 100)
                        if let elements: [NearEarthObject] = nearEarthObjects[date.toString()] {
                            RegularSubtitle(text: elements.map { $0.name }.joined(separator: ", "))
                        }
                    }
                }
            }
        }
    }
}

struct SpaceView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceView(viewModel: SpaceViewModel())
    }
}
