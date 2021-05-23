//
//  Presenter.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//
import Combine
import SwiftUI

public protocol PresenterProtocol: ObservableObject {
    associatedtype TInteractor: InteractorProtocol
    associatedtype TRouter: RouterProtocol
    
    // TODO: all values are public!! 
    var interactor: TInteractor { get set }
    var router: TRouter { get set }
    var currentViewState: ViewState { get set }
    var stateHandler: StateHandlerProtocol { get set }
    var cancellables: Set<AnyCancellable> { get set }
    func bindInteractor()
    init()
    init(stateHandler: StateHandlerProtocol)
}
