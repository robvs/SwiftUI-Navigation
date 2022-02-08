//
//  NavigationDetailView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/8/22.
//

import SwiftUI

struct NavigationDetailView: View {

    @StateObject var viewModel: NavigationDetailViewModel

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Name: \(viewModel.name ?? "")")
                Text("Description: \(viewModel.description ?? "")")
            }
            Spacer()
        }
        .padding()
        .overlay(ActivitySpinner(isShowing: viewModel.showingSpinner))
        .onAppear { viewModel.load() }
    }
}

struct NavigationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDetailView(viewModel: NavigationDetailViewModel(stuffId: "1"))
    }
}
