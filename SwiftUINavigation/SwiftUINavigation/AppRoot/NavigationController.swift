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
    case deepLinkView
}

enum RootNavigationSelection {
    case firstNavSubview
    case secondNavSubview
}

final class NavigationController: ObservableObject {

    /// Id of the current root view.
    @Published private (set) var presentedRootView: RootViewId
    @Published var selectedTabItem: MainTabItem
    @Published var isTabViewPresented: Bool
    @Published var rootNavigationSelection: RootNavigationSelection?

    /// Edge indicators that are used to indicate the direction of transition when the root view changes.
    private (set) var transitionRemovalEdge: Edge = .trailing
    private (set) var transitionInsertionEdge: Edge = .leading {
        didSet {
            transitionRemovalEdge = oldValue
        }
    }

    init(initialRootView: RootViewId = .mainTabbedView,
         initialTab: MainTabItem = .first) {

        presentedRootView = initialRootView
        selectedTabItem = initialTab
        isTabViewPresented = true
    }

    /// Navigate to the given root view.
    /// - parameter viewId: Id of the view to be displayed.
    func navigate(to viewId: RootViewId) {
        // set the transition edges first to ensure that the root view slides in the correct direction
        transitionInsertionEdge = transitionRemovalEdge
        
        presentedRootView = viewId
        print("Root view changed to \(viewId)")
    }

    /// Navigate to the given root navigation subview.
    /// - parameter navSubView: Root navigation subview to be shown.
    func navigate(to navSubView: RootNavigationSelection) {
        // set the transition edges first to ensure that the root view slides in the correct direction
        transitionInsertionEdge = transitionRemovalEdge

        presentedRootView = .baseNavigationView
        rootNavigationSelection = navSubView
        print("Root view changed to \(navSubView)")
    }

    /// Navigate to the given main tab view.
    /// - parameter tabViewItem: The main tab to be shown.
    func navigate(to tabViewItem: MainTabItem) {
        // set the transition edges first to ensure that the root view slides in the correct direction
        transitionInsertionEdge = transitionRemovalEdge

        presentedRootView = .mainTabbedView
        selectedTabItem = tabViewItem
        print("Root view changed to \(tabViewItem)")
    }
}
