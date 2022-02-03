//
//  MainTabView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/3/22.
//

import SwiftUI

struct MainTabView: View {

    private (set) var selectedTabItem: MainTabItem
    private var viewModel: MainTabViewModel

    init(selectedTabItem: MainTabItem,
         tabChangeAction: @escaping MainTabViewChangeAction) {
        
        self.selectedTabItem = selectedTabItem
        viewModel = MainTabViewModel(tabChangeAction: tabChangeAction)
    }

    var body: some View {
        VStack(spacing: 0.0) {
            Spacer()
            Divider()
            HStack(spacing: 0.0) {
                MainTabItemButton<MainTabViewModel>(tabItem: .first)
                MainTabItemButton<MainTabViewModel>(tabItem: .second)
            }
            .environmentObject(viewModel)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(selectedTabItem: .first) { newTabItem in
            print("Tab item changed to \(newTabItem.label)")
        }
    }
}
