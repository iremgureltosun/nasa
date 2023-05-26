//
//  AsteroidsView.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import SwiftUI

struct AsteroidsView: View {
    @ObservedObject private var viewModel: AsteroidsViewModel

    init(viewModel: AsteroidsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            VStack(spacing: DesignConfig.Spaces.smallSpace) {
                Picker("Select a datet", selection: $viewModel.selectedDate) {
                    ForEach(Array(viewModel.nearEarthObjects.keys), id: \.self) { key in
                        Text(key)
                    }
                }
                .pickerStyle(.wheel) // Use wheel style for scrolling
                .padding()

                Text("Selected object: \(viewModel.selectedDate)")
                    .padding()
            }
        }.ignoresSafeArea()
    }
}

// struct AsteroidsView_Previews: PreviewProvider {
//    static var previews: some View {
//        let list: [String: NearEarthObject] = [:]
//        list["2023-01-01"] = NearEarthObject(links: nil, id: <#T##String#>, neoReferenceID: <#T##String#>, name: <#T##String#>, nasaJplURL: <#T##String#>, absoluteMagnitudeH: <#T##Double#>, estimatedDiameter: <#T##EstimatedDiameter#>, isPotentiallyHazardousAsteroid: <#T##Bool#>, closeApproachData: <#T##[CloseApproachDatum]#>, isSentryObject: <#T##Bool#>)
//        let viewModel = AsteroidsViewModel(selectedDate: "2023-01-01", nearEarthObjects: list)
//        AsteroidsView(viewModel: viewModel)
//    }
// }
