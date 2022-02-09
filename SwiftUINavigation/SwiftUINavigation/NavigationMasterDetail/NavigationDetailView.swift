//
//  NavigationDetailView.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/8/22.
//

import SwiftUI

struct NavigationDetailView: View {

    @EnvironmentObject var navigationController: NavigationController

    @StateObject var viewModel: NavigationDetailViewModel
    @State private var originalTabViewPresentedState: Bool = true

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
        .onAppear {
            originalTabViewPresentedState = navigationController.isTabViewPresented
            navigationController.isTabViewPresented = false
            viewModel.load()
        }
        .onDisappear(perform: {
            navigationController.isTabViewPresented = originalTabViewPresentedState
        })
        .navigationTitle("Navigation Detail: \(viewModel.name ?? "")")
    }
}

struct NavigationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = NavigationController()
        NavigationDetailView(viewModel: NavigationDetailViewModel(stuffId: "1"))
            .environmentObject(navigationController)
    }
}
