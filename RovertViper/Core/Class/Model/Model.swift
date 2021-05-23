//
//  ViperDataModel.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 21.03.2021.
//

import Combine

open class Model: ModelProtocol, ObservableObject {
    
    public var cancellables = Set<AnyCancellable>()
    
    @Published public var viewState: ViewState = .empty
    
    public required init(state: ViewState = .empty) {
        viewState = state
    }
    
    public func fetch<WrappedType: Decodable>(publisher: AnyPublisher<WrappedType, Error>) -> AnyPublisher<Wrapper<WrappedType>, Never> {
        return handleState(publisher: publisher)
            .flatMap { Just<Wrapper<WrappedType>>(.init(data: $0)) }
            .replaceError(with: .init(data: nil))
            .eraseToAnyPublisher()
    }
    
    public func handleState<WrappedType: Decodable>(publisher: AnyPublisher<WrappedType, Error>) -> AnyPublisher<WrappedType, Error> {
        publisher
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveSubscription: { (sub) in
                print("receiveSubscription")
                if(self.viewState != .onLoading) {
                    self.viewState = .onLoading
                }
            }, receiveOutput: { (output) in
                print("receiveOutput")
            }, receiveCompletion: { (completion) in
                switch completion {
                case .failure:
                    self.viewState = .onThrowError
                case .finished:
                    self.viewState = .afterLoading
                }
                print("receiveCompletion")
                self.viewState = .empty
            }, receiveCancel: {
                print("receiveCancel")
            }, receiveRequest: { (demand) in
                print("receiveRequest")
            })
            .eraseToAnyPublisher()
    }
}

public final class Wrapper<WrappedType: Decodable> {
    public var wrapped: WrappedType?
    init(data: WrappedType?) {
        wrapped = data
    }
}
