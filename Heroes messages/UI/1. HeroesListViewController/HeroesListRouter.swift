//
//  HeroesListRouter.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

final class HeroesListRouter {
    
    weak var transitionHandler: UIViewController?
    
    private let detailsAssembly = CharacterChatAssembly()
    
    func moveToDetails(hero: Character) {
        guard let transitionHandler = transitionHandler else { return }
        
        let viewController = detailsAssembly.assemnle(hero: hero)
        transitionHandler.present(viewController, animated: true)
    }
}
