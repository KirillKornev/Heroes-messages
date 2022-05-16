//
//  CharacterChatViewController.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit
import SnapKit

protocol CharacterChatView: AnyObject {
    func updateMessages()
    func updateQuickAnswers(with messages: [Message])
    func scrollToBottom()
}

final class CharacterChatViewController: UIViewController {
    
    // Dependencies
    let presenter: CharacterChatPresenter
    
    // UI
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.backgroundColor = .clear
        table.register(InputChatCell.self, forCellReuseIdentifier: String(describing: InputChatCell.self))
        table.register(OutputChatCell.self, forCellReuseIdentifier: String(describing: OutputChatCell.self))
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    private lazy var board: BoardView = {
        let view = BoardView()
        view.delegate = presenter
        return view
    }()
    
    // MARK: - Initialization
    
    init(presenter: CharacterChatPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }
    
    // MARK: - LyfeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        presenter.viewDidLoad()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        view.backgroundColor = .gray
        view.addSubview(board)
        board.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(CGFloat(20))
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(CGFloat(40))
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.bottom.equalTo(board.snp.top)
        }
    }
}

// MARK: - CharacterChatView

extension CharacterChatViewController: CharacterChatView {
    
    func updateMessages() {
        tableView.reloadData()
    }
    
    func updateQuickAnswers(with messages: [Message]) {
        board.updateMessages(with: messages)
    }
    
    func scrollToBottom() {
        let indexPath = IndexPath(row: presenter.dataSource.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}
