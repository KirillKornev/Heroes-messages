//
//  CharacterChatViewController+UITableViewDataSource.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

extension CharacterChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = presenter.dataSource[indexPath.row]
        
        if model.type == .input {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InputChatCell.self)) as? InputChatCell else { return UITableViewCell() }
            cell.title.text = model.text
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OutputChatCell.self)) as? OutputChatCell else { return UITableViewCell() }
            cell.title.text = model.text
            cell.selectionStyle = .none
            return cell
        }
    }
}
