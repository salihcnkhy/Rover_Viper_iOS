//
//  ViperView.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//

import SwiftUI
import Combine

public protocol ViperView: View {
    associatedtype TPresenter: Presenter
    var presenter: StateObject<TPresenter> { get set}
}
