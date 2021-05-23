//
//  AppStore.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 10.04.2021.
//

public struct AppStore {
    public static var shared: AppStore = .init()
    
    public var themeStore: ThemeStore
    
    private init() {
        themeStore = DefaultThemeStore.shared
    }
}
