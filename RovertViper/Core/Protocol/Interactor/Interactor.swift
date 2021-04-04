//
//  Interactor.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 19.03.2021.
//

public protocol Interactor {
    associatedtype DataModelType: ViperModel
    var model: DataModelType { get set }
    init()
    init(model: DataModelType)
}
