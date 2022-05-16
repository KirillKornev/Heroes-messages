//
//  Fake.swift
//  Heroes messages
//
//  Created by Кирилл on 16.05.2022.
//

import Foundation

final class Fake {
    
    func buildFakeMessage(type: Message.MessageType) -> Message {
        let randomText = texts.randomElement() ?? ""
        
        return Message(text: randomText, type: type, created: Date())
    }
    
    // MARK: - Private
    
    var texts: [String] =
        ["Hello",
         "How are you",
         "Today is a good day",
         "I'm a hero",
         "Which hero do you like",
         "I'm not a hero",
         "I like coding",
         "Do you like coding"]
}
