# SwiftUI-Navigation
Basic navigation techniques using SwiftUI.

## AppRoot
File group that contains views that site at the application's root level.

### RootView
The base content view for the application. It uses the `presentedRootView` value in the navigation controller to determine which root-level view to display.

### RootTabbedView
The root view for performing tab bar style navigation. Note that this uses a custom tab view because because SwiftUI's `TabView` is too inflexible (i.e. it doesn't allow hiding the tab bar).

### RootNavigationView
The root view for performing standard `NavigationView` style navigation.

### DeepLinksView
A view that demonstrates how to use `NavigationController` to perform deep link navigation.
