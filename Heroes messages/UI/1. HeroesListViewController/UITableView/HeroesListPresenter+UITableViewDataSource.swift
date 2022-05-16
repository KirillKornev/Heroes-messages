//
//  HeroesListPresenter+UITableViewDataSource.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

extension HeroesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterCell.self)) as? CharacterCell else { return UITableViewCell() }

        let model = presenter.dataSource[indexPath.row]
        cell.title.text = model.name
        cell.selectionStyle = .none
        presenter.image(for: model) { image in
            
            DispatchQueue.main.async {
                cell.logo.image = image
            }
        }
        return cell
    }
}
