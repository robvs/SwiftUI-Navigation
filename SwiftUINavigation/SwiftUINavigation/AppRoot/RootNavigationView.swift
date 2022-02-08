//
//  RootNavigationView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

struct RootNavigationView: View {

    @EnvironmentObject var navigationController: NavigationController
    @State private var selection: String? = nil

    var body: some View {
        NavigationView {
            VStack(spacing: 8.0) {
                Text("Root navigation view")
                    .fontWeight(.bold)
                    .padding()

                firstViewNavigationButton
                masterDetailNavigationButton

                Button("Show Tabbed View") { navigationController.navigate(to: .mainTabbedView) }
            }
            .navigationTitle("Navigation \(selection ?? "")")
        }
    }

    var firstViewNavigationButton: some View {
        Group {
            Button("Show First View")  { selection = "First" }

            NavigationLink(destination: Text("First View"),
                           tag: "First",
                           selection: $selection) {
                EmptyView()
            }
        }
    }

    var masterDetailNavigationButton: some View {
        Group {
            Button("Show Master/Detail View") { selection = "Second" }

            NavigationLink(destination: NavigationMasterListView(),
                           tag: "Second",
                           selection: $selection) {
                EmptyView()
            }
        }
    }
}

struct FullScreenBaseNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = NavigationController()
        RootNavigationView()
            .environmentObject(navigationController)
    }
}
