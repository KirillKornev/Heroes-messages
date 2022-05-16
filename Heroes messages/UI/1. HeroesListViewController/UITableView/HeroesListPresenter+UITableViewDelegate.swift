//
//  HeroesListPresenter+UITableViewDelegate.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

extension HeroesListPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTap(indexPath: indexPath)
    }
}
