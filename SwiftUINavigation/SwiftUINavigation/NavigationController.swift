//
//  NavigationController.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import Foundation

enum RootViewId {
    case mainTabbedView
    case baseNavigationView
}

final class NavigationController: ObservableObject {

    @Published private (set) var visibleRootView: RootViewId = .mainTabbedView

    func navigate(to viewId: RootViewId) {
        visibleRootView = viewId
        print("Root view changed to \(viewId)")
    }
}
