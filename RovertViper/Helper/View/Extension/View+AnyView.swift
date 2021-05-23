//
//  View+AnyView.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 5.04.2021.
//

import SwiftUI

public extension View {
    func eraseViewToAnyView() -> AnyView {
        AnyView(self)
    }
}
public extension AnyView {
    static var empty: AnyView { AnyView(EmptyView()) }
}
