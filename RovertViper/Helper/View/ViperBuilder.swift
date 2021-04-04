//
//  ViperBuilder.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 22.03.2021.
//

import SwiftUI

public struct ViperBuilder<Content: View, PresenterT: Presenter>: View {
    let content: Content
    var presenter: PresenterT
    
    public init(presenter: PresenterT, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.presenter = presenter
    }
    
    public var body: some View {
        ZStack {
            content
            presenter.stateHandler.stateView
        }
    }
}
