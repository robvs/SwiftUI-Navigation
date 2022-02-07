//
//  MainTabView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/3/22.
//

import Combine
import SwiftUI

struct MainTabView: View {

    @Binding var selectedTabItem: MainTabItem

    var body: some View {
        VStack(spacing: 0.0) {
            Spacer()
            Divider()
            HStack(spacing: 0.0) {
                MainTabItemButton(tabItem: .first, selectedTabItem: $selectedTabItem)
                MainTabItemButton(tabItem: .second, selectedTabItem: $selectedTabItem)
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(selectedTabItem: .constant(.first))
    }
}
