//
//  RootView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

struct RootView: View {

    @State private var tabSelection: Int = 1

    var body: some View {
        ZStack {
            TabView(selection: $tabSelection) {
                Text("This is tab 1")
                    .tabItem { Text("tab 1") }
                    .tag(1)

                Text("This is tab 2")
                    .tabItem { Text("tab 2") }
                    .tag(2)
            }

            Text("On top of tab view \(tabSelection)")
                .foregroundColor(.purple)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
