//
//  MainTabItemButton.swift
//  SwiftUINavigation
//
//  Created by Rob Vander Sloot on 2/2/22.
//

import SwiftUI


// MARK: Protocols

/// Protocol for an object that handles actions on a MainTabItemButton.
protocol MainTabItemButtonHandling: ObservableObject {
    /// The currently selected tab item among a set of MainTabItemButtons
    ///
    /// NOTE: This must be marked @Published in the object that implements this protocol to ensure
    /// that changes cause the button item to redraw.
    var selectedTabItem: MainTabItem { get }

    /// Indicates that the given tab item button was pressed.
    func mainTabItemButtonItemWasSelected(_ tabItem: MainTabItem)
}


// MARK: View definition

/// Individual tab button that displays an icon and label.
struct MainTabItemButton: View {

    let tabItem: MainTabItem
    @Binding var selectedTabItem: MainTabItem

    var body: some View {
        Button(action: { selectedTabItem = tabItem },
               label: { buttonView() })
            .buttonStyle(MainTabItemButtonStyle())
    }

    private func buttonView() -> some View {
        ZStack {
            Rectangle()
                .fill(Color(.systemBackground))
                .frame(height: 60.0)
            VStack {
                Image(systemName: tabItem.imageName)
                    .font(Font.system(.title3))
                Text(tabItem.label)
                    .font(.system(size: 10))
                    .lineLimit(1)
            }
            .foregroundColor(selectedTabItem == tabItem ? tabItem.accentColor : .gray)
        }
    }

    struct MainTabItemButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.caption2)
        }
    }
}


// MARK: Previews

struct MainTabItemButton_Previews: PreviewProvider {

    static var previews: some View {
        let buttonHandler = FakeMainTabItemButtonHandler()
        HStack(spacing: 0.0) {
            MainTabItemButton(tabItem: .first, selectedTabItem: .constant(.first))
            MainTabItemButton(tabItem: .second, selectedTabItem: .constant(.first))
        }
        .environmentObject(buttonHandler)
    }
}


// MARK: Fake MainTabItemButtonHandling

class FakeMainTabItemButtonHandler: MainTabItemButtonHandling {
    @Published private (set) var selectedTabItem: MainTabItem = .first

    func mainTabItemButtonItemWasSelected(_ tabItem: MainTabItem) {
        selectedTabItem = tabItem
    }
}
