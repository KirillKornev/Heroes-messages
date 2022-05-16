//
//  HeroesListPresenter.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

final class HeroesListPresenter: NSObject {
    
    // Dependenvies
    weak var view: HeroesListViewProtocol?
    private let loader = CharectersLoader()
    private let imageLoader = ImageLoader()
    private let router: HeroesListRouter
    
    // Properties
    private(set) var dataSource: [Character] = []
    
    // MARK: Initialization
    
    init(router: HeroesListRouter) {
        self.router = router
    }
    
    // MARK: - Internal
    
    func viewDidLoad() {
        view?.showLoader()
        loadCharacters()
    }
    
    func didTap(indexPath: IndexPath) {
        guard let hero = dataSource[safe: indexPath.row] else { return }
        router.moveToDetails(hero: hero)
    }
    
    func image(for characher: Character, completion: @escaping (UIImage?) -> Void) {
        imageLoader.image(urlString: characher.url.extractImage()) { result in
            switch result {
            case .success(let image):
                completion(image)
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    // MARK: - Private
    
    private func loadCharacters() {
        loader.loadCharacters { charecters in
            
            DispatchQueue.main.async {
                self.dataSource = charecters
                self.view?.updateHeroesList()
                self.view?.hideLoader()
            }
        }
    }
}
