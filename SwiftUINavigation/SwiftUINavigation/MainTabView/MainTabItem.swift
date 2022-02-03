//
//  MainTabItem.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI


enum MainTabItem: Int, Hashable, Comparable {

    case first
    case second

    init(value: Int) {
        guard let tab = MainTabItem(rawValue: value) else {
            self = .first
            return
        }

        self = tab
    }

    var label: String {
        switch self {
        case .first:
            return "First"

        case .second:
            return "Second"
        }
    }

    var imageName: String {
        switch self {
        case .first:
            return "bus.fill"

        case .second:
            return "gearshape"
        }
    }

    var accentColor: Color {
        switch self {
        case .first:
            return .black

        case .second:
            return .black
        }
    }

    // MARK: Comparable
    static func < (lhs: MainTabItem, rhs: MainTabItem) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
