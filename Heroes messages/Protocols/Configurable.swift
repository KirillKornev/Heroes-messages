//
//  Configurable.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation

protocol Configurable {
    
    associatedtype Model
    
    func configure(with model: Model)
}
