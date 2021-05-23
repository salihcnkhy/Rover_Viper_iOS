//
//  ThemeStore.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 11.04.2021.
//

public protocol ThemeStore {
    static var shared: ThemeStore { get }
    var navigationBarType: DefaultNavigationBarView.Type { get set }
}
