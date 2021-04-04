//
//  Presenter.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//
import Combine
import SwiftUI

public protocol Presenter: ObservableObject {
    associatedtype TInteractor: Interactor
    associatedtype TRouter: Router
    
    var interactor: TInteractor { get set }
    var router: TRouter { get set }
    var currentViewState: ViewState { get set }
    var stateHandler: StateHandlerProtocol { get set }
    var cancellables: Set<AnyCancellable> { get set }
    func bindInteractor()
    init()
    init(stateHandler: StateHandlerProtocol)
}
