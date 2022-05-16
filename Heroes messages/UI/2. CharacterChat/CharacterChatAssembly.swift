//
//  CharacterChatAssembly.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

final class CharacterChatAssembly {
    
    func assemnle(hero: Character) -> UIViewController {
        let presenter = CharacterChatPresenter(hero: hero)
        let viewController = CharacterChatViewController(presenter: presenter)
        
        presenter.view = viewController
        
        return viewController
    }
}
