//
//  ViperPresenter.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//

import Combine
import SwiftUI

open class ViperPresenter<InteractorType: Interactor, RouterType: Router>: Presenter {

    public var cancellables: Set<AnyCancellable> = .init()
    public var interactor: InteractorType = .init()
    public var router: RouterType = .init()
    public var stateHandler: StateHandlerProtocol
    @Published public var currentViewState: ViewState = .empty
    
    public required init() {
        stateHandler = DefaultViewStateHandler()
        bindInteractor()
        bindStateHandler()
    }
    
    public required init(stateHandler: StateHandlerProtocol) {
        self.stateHandler = stateHandler
        bindInteractor()
        bindStateHandler()
    }
    
    open func bindInteractor() {
        interactor.model.$viewState
            .receive(on: RunLoop.main)
            .assign(to: \.currentViewState, on: self)
            .store(in: &cancellables)
    }
    
    private func bindStateHandler() {
        $currentViewState
            .receive(on: RunLoop.main)
            .sink { state in
                self.stateHandler.state = state
            }.store(in: &cancellables)
    }
}

public protocol StateHandlerProtocol {
    var stateView: AnyView { get set }
    var state: ViewState { get set }
    init(state: ViewState)
}

public struct DefaultViewStateHandler: StateHandlerProtocol {
    
    public var state: ViewState {
        willSet {
            var newStateView = EmptyView().eraseViewToAnyView()
            switch newValue {
            case .onLoading:
                newStateView = RoundedRectangle(cornerRadius: 12).fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .eraseViewToAnyView()
            default:
                newStateView = EmptyView().eraseViewToAnyView()
            }
            self.stateView = newStateView
        }
    }
    
    public var stateView: AnyView = EmptyView().eraseViewToAnyView()

    public init(state: ViewState = .empty) {
        self.state = state
    }
}

public enum ViewState {
    case empty
    case willAppear
    case didAppear
    case onLoading
    case afterLoading
    case willThrowError
    case onThrowError
    case willDisappear
    case didDisappear
}

public extension View {
    func eraseViewToAnyView() -> AnyView {
        AnyView(self)
    }
}
