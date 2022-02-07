//
//  RootView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

struct RootView: View {

    @StateObject var navigationController = NavigationController()

    var body: some View {
        ZStack {
            Group {
                switch navigationController.visibleRootView {
                case .mainTabbedView:
                    MainTabbedView()

                case .baseNavigationView:
                    FullScreenBaseNavigationView()
                }
            }
            .animation(.default, value: navigationController.visibleRootView)
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
