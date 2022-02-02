//
//  NavigationController.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import Foundation

enum RootViewDesignation {
    case mainTabbedView
    case baseNavigationView
}

final class NavigationController: ObservableObject {

    @Published private (set) var visibleRootView: RootViewDesignation = .mainTabbedView

    func navigate(to view: RootViewDesignation) {
        visibleRootView = view
    }
}
