//
//  TitleView.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import SwiftUI

struct TitleView: View {
    var title: String

    init(title: String) {
        self.title = title
    }

    var body: some View {
        Rectangle()
            .fill(Color.black)
            .frame(height: 100)
            .overlay {
                Text(title)
                    .foregroundColor(Color.white)
                    .font(Font.custom(FontsConfig.Fonts.bold, size: FontsConfig.FontSizes.xLarge))
                    .fontWeight(.bold)
                    .padding(.horizontal, DesignConfig.Spaces.mediumSpace)
                    .multilineTextAlignment(.center)
            }
    }
}

struct MovieTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Astronomy Picture of the Day")
    }
}
