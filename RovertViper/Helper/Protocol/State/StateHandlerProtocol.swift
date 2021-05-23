//
//  StateHandlerProtocol.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 5.04.2021.
//

import SwiftUI

public protocol StateHandlerProtocol {
    var stateView: AnyView { get set }
    var state: ViewState { get set }
    init(state: ViewState)
}
