//
//  MainTabViewModel.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/3/22.
//

import Foundation


typealias MainTabViewChangeAction = (_ newTabItem: MainTabItem) -> Void


final class MainTabViewModel: MainTabItemButtonHandling {

    @Published private (set) var selectedTabItem: MainTabItem = .first
    private let tabChangeAction: MainTabViewChangeAction

    init(tabChangeAction: @escaping MainTabViewChangeAction) {
        self.tabChangeAction = tabChangeAction
    }

    func mainTabItemButtonItemWasSelected(_ tabItem: MainTabItem) {
        // ignore if the selected tab did not change
        guard tabItem != selectedTabItem else {
            return
        }

        selectedTabItem = tabItem
        tabChangeAction(tabItem)
    }
}
