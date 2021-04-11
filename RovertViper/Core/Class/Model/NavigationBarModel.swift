//
//  NavigationBarModel.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 11.04.2021.
//


public struct NavigationBarModel {
    // TODO: make fields optional
    public init(title: String, subtitle: String, isRoot: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.isRoot = isRoot
    }
    
    let title: String
    let subtitle: String
    let isRoot: Bool
}
