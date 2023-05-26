//
//  ApodDetail.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import SwiftUI

struct ApodDetailView: View {
    @ObservedObject private var viewModel: ApodDetailViewModel

    init(viewModel: ApodDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: DesignConfig.Spaces.smallSpace) {
                    RemoteImageView(url: viewModel.imageUrl, contentMode: .fill)
                        .padding(.top, -100)

                    VStack(alignment: .leading, spacing: DesignConfig.Spaces.smallSpace) {
                        Title(text: viewModel.title)
                            .lineLimit(2)
                        RegularSubtitle(text: viewModel.description)
                    }
                    .padding(.horizontal, DesignConfig.Spaces.smallSpace)
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: ButtonBack())
    }
}

struct ApodView_Previews: PreviewProvider {
    static var previews: some View {
        let url = "https://credo.academy/credo-academy@3x.png"
        let title = "Astronomy Picture of the Day"
        let dummyText = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
        ApodDetailView(viewModel: ApodDetailViewModel(imageUrl: url, title: title, description: dummyText))
    }
}
