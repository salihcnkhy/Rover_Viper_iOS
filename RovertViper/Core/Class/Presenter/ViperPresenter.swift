//
//  ViperPresenter.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//

import Combine
import SwiftUI

open class ViperPresenter<InteractorType: Interactor, RouterType: Router>: Presenter {
    // TODO: More handler for view??
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




