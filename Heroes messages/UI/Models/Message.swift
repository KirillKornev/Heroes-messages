//
//  Message.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation

struct Message {
    let text: String
    let type: MessageType
    let created: Date
    
    enum MessageType {
        case input
        case output
    }
}
