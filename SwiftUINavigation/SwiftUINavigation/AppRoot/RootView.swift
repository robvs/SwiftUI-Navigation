//
//  RootView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

/// The base content view for the application. It uses the `presentedRootView` value in the navigation
/// controller to determine which root-level view to display.
struct RootView: View {

    @StateObject var navigationController = NavigationController(initialRootView: .baseNavigationView)

    var body: some View {
        ZStack {
            Group {
                switch navigationController.presentedRootView {
                case .mainTabbedView:
                    RootTabbedView()

                case .baseNavigationView:
                    RootNavigationView()

                case .deepLinkView:
                    DeepLinksView()
                }
            }
            // perform left/right slide transitions when moving between root views
            .animation(.default, value: navigationController.presentedRootView)
            .transition(AnyTransition.asymmetric(insertion: .move(edge: navigationController.transitionInsertionEdge),
                                                 removal: .move(edge: navigationController.transitionRemovalEdge)))
        }
        .environmentObject(navigationController)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
