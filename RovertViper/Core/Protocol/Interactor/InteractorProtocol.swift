//
//  InteractorProtocol.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//

public protocol InteractorProtocol {
    associatedtype DataModelType: Model
    var model: DataModelType { get set }
    init()
    init(model: DataModelType)
}
