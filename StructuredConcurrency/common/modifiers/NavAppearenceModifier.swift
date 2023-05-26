//
//  NavAppearenceModifier.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//
import Foundation
import SwiftUI

struct ButtonBack: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(ImagesConfig.Navigation.back.rawValue) // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
            }
        }
    }
}
