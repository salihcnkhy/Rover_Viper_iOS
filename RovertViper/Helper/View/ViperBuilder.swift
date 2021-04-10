//
//  ViperBuilder.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 22.03.2021.
//

import SwiftUI

public struct ViperPageBuilder<Content: View, PresenterT: Presenter>: View {
    let content: Content
    var presenter: PresenterT
    
    public init(presenter: PresenterT, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.presenter = presenter
    }
    
    public var body: some View {
        ZStack {
            VStack {
                // TODO: store navigation type, screen title, subtitle, isRoot etc. and create a protocol for navigationbar view
                NavigationBar(title: "Collection", subtitle: "All collections", isRoot: presenter.router.isRoot)
                // TODO: Stretch content to available height
                content
            }
            presenter.stateHandler.stateView
        }
    }
}
