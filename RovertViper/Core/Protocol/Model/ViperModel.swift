//
//  DataModel.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//
import Combine

public protocol Model {
       
    var statePublisher: Published<ViewState>.Publisher { get }

    init(state: ViewState)
    func fetch<WrappedType: Decodable>(publisher: AnyPublisher<WrappedType, Error>) -> AnyPublisher<Wrapper<WrappedType>, Never>
    func handleState<WrappedType: Decodable>(publisher: AnyPublisher<WrappedType, Error>) -> AnyPublisher<WrappedType, Error>
}
