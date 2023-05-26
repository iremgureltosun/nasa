//
//  ActivityIndicator.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    typealias UIView = UIActivityIndicatorView
    var isAnimating: Bool
    var configuration = { (_: UIView) in }

    func makeUIView(context _: UIViewRepresentableContext<Self>) -> UIView { UIView() }
    func updateUIView(_ uiView: UIView, context _: UIViewRepresentableContext<Self>) {
        if isAnimating == true {
            uiView.startAnimating()
        } else { uiView.stopAnimating() }
        configuration(uiView)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(isAnimating: true)
    }
}
