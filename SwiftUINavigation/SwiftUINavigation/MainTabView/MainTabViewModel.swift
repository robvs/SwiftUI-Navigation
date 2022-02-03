//
//  MainTabViewModel.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/3/22.
//

import Foundation


final class MainTabViewModel: MainTabItemButtonHandling {

    @Published private (set) var selectedTabItem: MainTabItem = .first

    func mainTabItemButtonItemWasSelected(_ tabItem: MainTabItem) {
        selectedTabItem = tabItem
    }
}
