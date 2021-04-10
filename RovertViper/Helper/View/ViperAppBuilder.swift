//
//  ViperAppBuilder.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 10.04.2021.
//

import SwiftUI

public struct ViperAppBuilder<Content: PageBuilder>: Scene {

    let content: Content
    
    public init(themeStore: ThemeStore = DefaultThemeStore.shared, @ViewBuilder content: () -> Content) {
        self.content = content()
        AppStore.shared.themeStore = themeStore
    }
    
    public var body: some Scene {
        WindowGroup {
            NavigationView {
                content
                    .navigationBarHidden(true)
            }
        }
    }
}
