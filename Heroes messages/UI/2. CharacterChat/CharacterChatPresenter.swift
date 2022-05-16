//
//  CharacterChatPresenter.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

final class CharacterChatPresenter: NSObject {
    
    // Dependencies
    private let fake = Fake()
    private let hero: Character
    private let storage = MessagesStorage()
    
    // Properties
    weak var view: CharacterChatView?
    private(set) var dataSource: [Message] = []
    
    init(hero: Character) {
        self.hero = hero
        dataSource = storage.obtainMessages(for: String(hero.id))
    }
    
    deinit {
        storage.saveMessages(dataSource, for: String(hero.id))
    }
    
    func viewDidLoad() {
        obtainMessages()
    }
    
    func obtainMessages() {
        if dataSource.isEmpty {
            dataSource = [.init(text: "Hello, I'm a hero \(hero.name)", type: .input, created: Date()),
                .init(text: "sfemfksme", type: .input, created: Date())]
        }
        
        view?.updateQuickAnswers(with: [fake.buildFakeMessage(type: .output),
                                        fake.buildFakeMessage(type: .output),
                                        fake.buildFakeMessage(type: .output),
                                        fake.buildFakeMessage(type: .output),
                                        fake.buildFakeMessage(type: .output)])
        view?.updateMessages()
    }
    
    func giveHeroAnswer() {
        let answer = fake.buildFakeMessage(type: .input)
        dataSource.append(answer)
        view?.updateMessages()
    }
}

// MARK: - BoardViewDelegate

extension CharacterChatPresenter: BoardViewDelegate {
    
    func didTapMessage(_ message: Message) {
        dataSource.append(message)
        view?.updateMessages()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.giveHeroAnswer()
            self.view?.scrollToBottom()
        }
    }
}
