//
//  DeepLinksView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/9/22.
//

import SwiftUI

struct DeepLinksView: View {

    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        VStack(spacing: 8.0) {
            Text("Deep Links View")
                .fontWeight(.bold)
                .padding()

            Button("Last Tabbed View") {
                navigationController.navigate(to: .mainTabbedView)
            }

            Button("First Tabbed View") {
                navigationController.navigate(to: .first)
            }

            Button("Second Tabbed View") {
                navigationController.navigate(to: .second)
            }

            Divider()

            Button("Root Nav View") {
                navigationController.navigate(to: .baseNavigationView)
            }

            Button("First Nav View") {
                navigationController.navigate(to: .firstNavSubview)
            }

            Button("Second Nav View") {
                navigationController.navigate(to: .secondNavSubview)
            }
        }
    }
}

struct DeepLinksView_Previews: PreviewProvider {
    static var previews: some View {
        DeepLinksView()
    }
}
