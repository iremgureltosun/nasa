//
//  View+Navigation.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import SwiftUI

// extension View {
//     func onNavigation(_ action: @escaping () -> Void) -> some View {
//         let isActive = Binding(
//             get: { false },
//             set: { newValue in
//                 if newValue {
//                     action()
//                 }
//             }
//         )
//         return self.fullScreenCover(isPresented: isActive) {
//             EmptyView()
//         }
//     }
//
//     func navigation<Item, Destination: View>(
//         item: Binding<Item?>,
//         @ViewBuilder destination: @escaping (Item) -> Destination
//     ) -> some View {
//         let isActive = Binding(
//             get: { item.wrappedValue != nil },
//             set: { value in
//                 if !value {
//                     item.wrappedValue = nil
//                 }
//             }
//         )
//         return navigation(isActive: isActive) {
//             item.wrappedValue.map(destination)
//         }
//     }
//
//     func navigation<Destination: View>(
//         isActive: Binding<Bool>,
//         @ViewBuilder destination: @escaping () -> Destination
//     ) -> some View {
//         return self.fullScreenCover(isPresented: isActive) {
//             isActive.wrappedValue ? destination() : nil
//         }
//     }
// }

extension View {
    func onNavigation(_ action: @escaping () -> Void) -> some View {
        let isActive = Binding(
            get: { false },
            set: { newValue in
                if newValue {
                    action()
                }
            }
        )
        return NavigationLink(
            destination: EmptyView(),
            isActive: isActive
        ) {
            self
        }
    }

    func navigation<Item, Destination: View>(
        item: Binding<Item?>,
        @ViewBuilder destination: (Item) -> Destination
    ) -> some View {
        let isActive = Binding(
            get: { item.wrappedValue != nil },
            set: { value in
                if !value {
                    item.wrappedValue = nil
                }
            }
        )
        return navigation(isActive: isActive) {
            item.wrappedValue.map(destination)
        }
    }

    func navigation<Destination: View>(
        isActive: Binding<Bool>,
        @ViewBuilder destination: () -> Destination
    ) -> some View {
        overlay(
            NavigationLink(
                destination: isActive.wrappedValue ? destination() : nil,
                isActive: isActive,
                label: { EmptyView() }
            )
        )
    }
}
