//
//  MainTabView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/3/22.
//

import SwiftUI

struct MainTabView: View {

    @StateObject var viewModel: MainTabViewModel = MainTabViewModel()

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
        MainTabView()
    }
}
