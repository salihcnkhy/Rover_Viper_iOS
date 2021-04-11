//
//  PageBuilderProtocol.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 11.04.2021.
//

import SwiftUI

public protocol PageBuilderProtocol: View {
    associatedtype Content: ViewProtocol
    init(content: Content)
}
