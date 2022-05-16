//
//  MarvelApiModel.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation

struct MarvelApiModel: Codable {
    var data: MarvelApiCharacterData
}

struct MarvelApiCharacterData: Codable {
    var count: Int
    var results: [Character]
}
