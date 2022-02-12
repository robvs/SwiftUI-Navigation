//
//  RootNavigationView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

/// The root view for performing standard `NavigationView` style navigation.
struct RootNavigationView: View {

    @EnvironmentObject var navigationController: NavigationController

    var body: some View {
        NavigationView {
            VStack(spacing: 8.0) {
                Text("Root navigation view")
                    .fontWeight(.bold)
                    .padding()

                firstViewNavigationButton
                masterDetailNavigationButton

                Button("Show Deep Link View")  { navigationController.navigate(to: .deepLinkView) }
            }
            .navigationTitle("Root Navigation View")
        }
    }

    var firstViewNavigationButton: some View {
        Group {
            Button("Show First View")  { navigationController.rootNavigationSelection = .firstNavSubview }

            NavigationLink(destination: Text("First View"),
                           tag: RootNavigationSelection.firstNavSubview,
                           selection: $navigationController.rootNavigationSelection) {
                EmptyView()
            }
        }
    }

    var masterDetailNavigationButton: some View {
        Group {
            Button("Show Master/Detail View") { navigationController.rootNavigationSelection = .secondNavSubview }

            NavigationLink(destination: NavigationMasterListView(),
                           tag: RootNavigationSelection.secondNavSubview,
                           selection: $navigationController.rootNavigationSelection) {
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
