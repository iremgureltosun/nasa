//
//  TabCoordinatorView.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 18.04.2023.
//

import Foundation
import SafariServices
import SwiftUI

struct HomeView: View {
    // MARK: Stored Properties

    @State var selection = ContentView.HomeTab.space

    // MARK: Views

    var body: some View {
        TabView(selection: $selection) {
            SpaceView(viewModel: SpaceViewModel())
                .tabItem {
                    if selection == ContentView.HomeTab.space {
                        Image(systemName: "bubbles.and.sparkles.fill")
                    } else {
                        Image(systemName: "bubbles.and.sparkles")
                    }
                }
                .tag(ContentView.HomeTab.space)
            PlaygroundView(viewModel: PlaygroundViewModel())
                .tabItem {
                    if selection == ContentView.HomeTab.playground {
                        Image(systemName: "camera.circle.fill")
                    } else {
                        Image(systemName: "camera.circle")
                    }
                }
                .tag(ContentView.HomeTab.space)
        }.onAppear {
            if #available(iOS 13.0, *) {
                let tabBarAppearance: UITabBarAppearance = .init()
                tabBarAppearance.configureWithDefaultBackground()
                tabBarAppearance.backgroundColor = UIColor(Color.white)
                UITabBar.appearance().standardAppearance = tabBarAppearance

                if #available(iOS 15.0, *) {
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                }
            }
        }
    }
}
