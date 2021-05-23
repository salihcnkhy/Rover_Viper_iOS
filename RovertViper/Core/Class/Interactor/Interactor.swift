//
//  Interactor.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//

open class Interactor<TModel: Model>: InteractorProtocol {
    // TODO: What can handle more?
    public var model: TModel
    
    public required init(model: TModel) {
        self.model = model
    }
    
    public required init() {
        model = .init(state: .empty)
    }
}
