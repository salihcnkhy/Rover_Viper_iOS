//
//  DefaultThemeStore.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 11.04.2021.
//

public struct DefaultThemeStore: ThemeStore {
    public static var shared: ThemeStore = DefaultThemeStore(navigationBarType: DefaultNavigationBarView.self)
    public var navigationBarType: DefaultNavigationBarView.Type
}

