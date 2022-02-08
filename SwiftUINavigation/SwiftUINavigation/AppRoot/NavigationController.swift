//
//  NavigationController.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

enum RootViewId {
    case mainTabbedView
    case baseNavigationView
}

final class NavigationController: ObservableObject {

    /// Id of the current root view.
    @Published private (set) var visibleRootView: RootViewId
    @Published var selectedTabItem: MainTabItem

    /// Edge indicators that are used to indicate the direction of transition when the root view changes.
    private (set) var transitionRemovalEdge: Edge = .trailing
    private (set) var transitionInsertionEdge: Edge = .leading {
        didSet {
            transitionRemovalEdge = oldValue
        }
    }

    init(initialRootView: RootViewId = .mainTabbedView,
         initialTab: MainTabItem = .second) {

        visibleRootView = initialRootView
        selectedTabItem = initialTab
    }

    /// Navigate to the given view.
    /// - parameter viewId: Id of the view to be displayed.
    func navigate(to viewId: RootViewId) {
        // set the transition edges first to ensure that the root view slides in the correct direction
        transitionInsertionEdge = transitionRemovalEdge
        
        visibleRootView = viewId
        print("Root view changed to \(viewId)")
    }
}
