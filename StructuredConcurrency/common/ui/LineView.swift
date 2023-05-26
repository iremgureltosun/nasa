//
//  LineView.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import SwiftUI

struct LineView: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(width: UIScreen.screenWidth - (DesignConfig.Spaces.mediumSpace * 2), height: 1)
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}
