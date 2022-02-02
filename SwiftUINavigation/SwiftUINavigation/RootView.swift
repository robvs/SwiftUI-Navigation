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
        Group {
            switch navigationController.visibleRootView {
            case .mainTabbedView:
                MainTabbedView(navigationController: navigationController)

            case .baseNavigationView:
                FullScreenBaseNavigationView(navigationController: navigationController)
            }
        }
        .animation(.default, value: navigationController.visibleRootView)
        .transition(AnyTransition.asymmetric(insertion: .move(edge: .leading),
                                             removal: .move(edge: .trailing)))
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
