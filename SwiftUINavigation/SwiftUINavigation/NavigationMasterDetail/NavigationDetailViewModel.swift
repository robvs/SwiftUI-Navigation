//
//  NavigationDetailViewModel.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/8/22.
//

import Foundation


struct StuffDetail {
    let id: String
    let name: String
    let description: String
}


final class NavigationDetailViewModel: ObservableObject {

    @Published private (set) var showingSpinner: Bool = false
    @Published private (set) var name: String?
    @Published private (set) var description: String?

    private let stuffId: String

    init(stuffId: String) {
        self.stuffId = stuffId
    }

    /// Load the details.
    ///
    /// This is expected to be called in .onAppear
    func load() {
        // only load once
        guard name == nil else { return }

        // fake an async data fetch
        showingSpinner = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            
            self.showingSpinner = false

            let stuffDetail = StuffDetail(id: self.stuffId,
                                          name: "Stuff \(self.stuffId)",
                                          description: "Stuff \(self.stuffId) description")
            self.name = stuffDetail.name
            self.description = stuffDetail.description
        }
    }
}
