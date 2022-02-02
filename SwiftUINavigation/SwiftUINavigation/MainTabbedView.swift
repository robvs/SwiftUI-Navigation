//
//  MainTabbedView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

struct MainTabbedView: View {

    let navigationController: NavigationController

    @State private var tabSelection: Int = 1

    var body: some View {
        TabView(selection: $tabSelection) {

            VStack {
                Text("This is tab \(tabSelection)")
                Button("Show Full Screen Nav View") {
                    navigationController.navigate(to: .baseNavigationView)
                }
            }
            .tabItem { Text("tab 1") }
            .tag(1)

            Text("This is tab \(tabSelection)")
                .tabItem { Text("tab 2") }
                .tag(2)
        }
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView(navigationController: NavigationController())
    }
}
