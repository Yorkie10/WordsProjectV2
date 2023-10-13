//
//  Tab.swift
//  WordsProjectV2
//
//  Created by Yerkebulan Sharipov on 04.10.2023.
//

import SwiftUI


struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [TabItem(text: "Learn how", icon: "house", tab: .main, color: .teal),
                TabItem(text: "Explore", icon: "magnifyingglass", tab: .favorities, color: .blue),
                TabItem(text: "Notifications", icon: "bell", tab: .notifications, color: .red),
                TabItem(text: "Library", icon: "rectangle.stack", tab: .library, color: .pink)]

enum Tab: String {
    case main
    case favorities
    case notifications
    case library
}


struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
