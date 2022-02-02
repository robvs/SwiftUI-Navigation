//
//  MainTabbedView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

struct MainTabbedView: View {

    @State private var tabSelection: Int = 1

    var body: some View {
        TabView(selection: $tabSelection) {
            Text("This is tab \(tabSelection)")
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
        MainTabbedView()
    }
}
