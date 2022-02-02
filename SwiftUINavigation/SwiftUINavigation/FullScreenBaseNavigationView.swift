//
//  FullScreenBaseNavigationView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI

struct FullScreenBaseNavigationView: View {

    let navigationController: NavigationController

    @State private var selection: String? = nil

    var body: some View {
        NavigationView {
            VStack {
                Text("Full screen base navigation view")
                    .foregroundColor(.purple)
                    .padding()

                Button("Show First View")  { self.selection = "First" }
                    .padding(.bottom)

                Button("Show Second View") { self.selection = "Second" }
                    .padding(.bottom)

                Button("Show Tabbed View") { navigationController.navigate(to: .mainTabbedView) }

                NavigationLink(destination: Text("First View"),
                               tag: "First",
                               selection: $selection) {
                    EmptyView()
                }

                NavigationLink(destination: Text("Second View"),
                               tag: "Second",
                               selection: $selection) {
                    EmptyView()
                }
            }
            .navigationTitle("Navigation \(selection ?? "")")
        }
    }
}

struct FullScreenBaseNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenBaseNavigationView(navigationController: NavigationController())
    }
}
