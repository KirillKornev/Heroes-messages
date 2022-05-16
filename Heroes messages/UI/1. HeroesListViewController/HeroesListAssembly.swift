//
//  HeroesListAssembly.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

final class HeroesListAssembly {
    
    // Dependencies
    private let router = HeroesListRouter()
    
    func assemble() -> UIViewController {
        let router = HeroesListRouter()
        let presenter = HeroesListPresenter(router: router)
        let controller = HeroesListViewController(presenter: presenter)
        
        presenter.view = controller
        router.transitionHandler = controller
        
        return controller
    }
}
