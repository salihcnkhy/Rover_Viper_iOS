//
//  ViperBuilder.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 22.03.2021.
//

import SwiftUI

public struct ViperPageBuilder<Content: ViperView>: PageBuilder {
    let content: Content
    let stateHandler: StateHandlerProtocol

    public init(content: Content) {
        self.content = content
        // TODO: leak
        self.stateHandler = content.presenter.wrappedValue.stateHandler
    }
    
    public var body: some View {
        ZStack {
            VStack {
                AppStore.shared.themeStore.navigationBarType.init(model: content.navigationBarModel)
                    .alignmentGuide(.top, computeValue: { $0[.top.self] })
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            stateHandler.stateView
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

public protocol PageBuilder: View {
    associatedtype Content: ViperView
    init(content: Content)
}

