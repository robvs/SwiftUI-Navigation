//
//  RootTabbedView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

struct RootTabbedView: View {

    @EnvironmentObject var navigationController: NavigationController

    var body: some View {
        ZStack {
            Group {
                switch navigationController.selectedTabItem {
                case .first:
                    firstTabView

                case .second:
                    masterListView
                }
            }
            // add bottom padding so that the bottom of the view will scroll above the tab view
            .padding(.bottom, AppDimension.tabViewHeight)

            if navigationController.isTabViewPresented {
                VStack {
                    Spacer()
                    MainTabView(selectedTabItem: $navigationController.selectedTabItem)
                }
            }
        }
    }

    private var firstTabView: some View {
        VStack(spacing: 8.0) {
            Text("This is tab \(navigationController.selectedTabItem.label)")
                .fontWeight(.bold)
                .padding()

            Button("Show Root Nav View") {
                navigationController.navigate(to: .baseNavigationView)
            }

            Button("Show First Nav View") {
                navigationController.navigate(to: .firstNavSubview)
            }
        }
    }

    private var masterListView: some View {
        NavigationView {
            NavigationMasterListView()
        }
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = NavigationController()
        RootTabbedView()
            .environmentObject(navigationController)
    }
}
