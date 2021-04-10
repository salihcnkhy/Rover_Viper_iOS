//
//  DefaultStateHelper.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 5.04.2021.
//

import SwiftUI

public struct DefaultViewStateHandler: StateHandlerProtocol {
    
    // TODO: Proper way???
    public var state: ViewState {
        willSet {
            var newStateView = AnyView.empty
            switch newValue {
            case .onLoading:
                // TODO: Put views to ThemeStore
                newStateView = DefaultLodingView().eraseViewToAnyView()
            default:
                newStateView = AnyView.empty
            }
            self.stateView = newStateView
        }
    }
    
    public var stateView: AnyView = EmptyView().eraseViewToAnyView()

    public init(state: ViewState = .empty) {
        self.state = state
    }
}
