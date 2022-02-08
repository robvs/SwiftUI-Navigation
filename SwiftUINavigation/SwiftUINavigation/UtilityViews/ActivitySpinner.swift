//
//  ActivitySpinner.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/8/22.
//

import SwiftUI


struct ActivitySpinner: View {
    var isShowing: Bool

    var body: some View {
        if isShowing {
            ProgressView()
        }
    }
}

struct ActivitySpinner_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySpinner(isShowing: true)
    }
}
