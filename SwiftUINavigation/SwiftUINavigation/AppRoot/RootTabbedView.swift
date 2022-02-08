//
//  RootTabbedView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

struct RootTabbedView: View {

    @EnvironmentObject var navigationController: NavigationController
    @State private var selectedTabItem: MainTabItem = .first

    var body: some View {
        VStack {
            Group {
                switch selectedTabItem {
                case .first:
                    VStack {
                        Text("This is tab \(selectedTabItem.label)")
                        Button("Show Full Screen Nav View") {
                            navigationController.navigate(to: .baseNavigationView)
                        }
                    }

                case .second:
                    Text("This is tab \(selectedTabItem.label)")
                }
            }

            MainTabView(selectedTabItem: $selectedTabItem)
        }
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = NavigationController()
        RootTabbedView()
            .environmentObject(navigationController)
    }
}
