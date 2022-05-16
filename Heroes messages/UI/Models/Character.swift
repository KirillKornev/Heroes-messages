//
//  Character.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

struct Character: Codable {
    var id: Int
    var name: String
    var description: String
    var url: [String: String]
    
    private enum CodingKeys : String, CodingKey {
        case id, name, description, url = "thumbnail"
    }
}
