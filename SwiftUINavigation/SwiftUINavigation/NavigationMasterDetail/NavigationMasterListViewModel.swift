//
//  NavigationMasterListViewModel.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/8/22.
//

import Foundation


struct Stuff: Identifiable {
    let id: String
    let name: String
}


final class NavigationMasterListViewModel: ObservableObject {

    @Published private (set) var stuffList: [Stuff]

    init() {
        stuffList = [Stuff(id: "1",  name: "stuff 1"),
                     Stuff(id: "2",  name: "stuff 2"),
                     Stuff(id: "3",  name: "stuff 3"),
                     Stuff(id: "4",  name: "stuff 4"),
                     Stuff(id: "5",  name: "stuff 5"),
                     Stuff(id: "6",  name: "stuff 6"),
                     Stuff(id: "7",  name: "stuff 7"),
                     Stuff(id: "8",  name: "stuff 8"),
                     Stuff(id: "9",  name: "stuff 9"),
                     Stuff(id: "10", name: "stuff 10"),
                     Stuff(id: "11", name: "stuff 11"),
                     Stuff(id: "12", name: "stuff 12"),
                     Stuff(id: "13", name: "stuff 13"),
                     Stuff(id: "14", name: "stuff 14"),
                     Stuff(id: "15", name: "stuff 15")]
    }
}
