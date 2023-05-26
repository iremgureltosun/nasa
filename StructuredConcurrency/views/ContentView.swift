//
//  ContentView.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//
import SwiftUI

struct ContentView: View {
    @State private var isActive = false

    var body: some View {
        NavigationView {
            Color.black.ignoresSafeArea().overlay(
                Title(text: "NASA")
                    .fullScreenCover(isPresented: $isActive, content: {
                        HomeView()
                    })
            ).onAppear {
                Task(priority: .background) {
                    await self.navigateToNextPage()
                }
            }
        }
    }

    @MainActor func navigateToNextPage() async {
        do {
            try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
            isActive = true
        } catch {
            debugPrint("Some error occured during navigation \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
