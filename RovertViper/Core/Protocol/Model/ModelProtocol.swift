//
//  ModelProtocol.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//
import Combine

public protocol ModelProtocol {
    var viewState: ViewState { get set }

    init(state: ViewState)
    func fetch<WrappedType: Decodable>(publisher: AnyPublisher<WrappedType, Error>) -> AnyPublisher<Wrapper<WrappedType>, Never>
    func handleState<WrappedType: Decodable>(publisher: AnyPublisher<WrappedType, Error>) -> AnyPublisher<WrappedType, Error>
}
