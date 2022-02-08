//
//  NavigationMasterListView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/8/22.
//

import SwiftUI

struct NavigationMasterListView: View {

    @StateObject private var viewModel: NavigationMasterListViewModel = NavigationMasterListViewModel()

    var body: some View {
        List(viewModel.stuffList) { stuffItem in
            NavigationLink(destination: NavigationDetailView(viewModel: NavigationDetailViewModel(stuffId: stuffItem.id))) {
                Text(stuffItem.name)
            }
        }
    }
}

struct NavigationMasterListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMasterListView()
    }
}
