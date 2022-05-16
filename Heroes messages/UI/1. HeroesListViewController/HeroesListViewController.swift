//
//  HeroesListViewController.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit
import SnapKit

protocol HeroesListViewProtocol: AnyObject {
    func showLoader()
    func hideLoader()
    func updateHeroesList()
}

final class HeroesListViewController: UIViewController {
    
    // Dependencies
    let presenter: HeroesListPresenter
    
    // UI
    private lazy var spinner = UIActivityIndicatorView(style: .large)
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = presenter
        table.backgroundColor = .clear
        table.register(CharacterCell.self, forCellReuseIdentifier: String(describing: CharacterCell.self))
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 40
        return table
    }()
    
    // MARK: - Initialization
    
    init(presenter: HeroesListPresenter) {
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
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

// MARK: - HeroesListViewProtocol

extension HeroesListViewController: HeroesListViewProtocol {
    
    func showLoader() {
        view.addSubview(spinner)
        spinner.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        spinner.startAnimating()
    }
    
    func hideLoader() {
        spinner.stopAnimating()
    }
    
    func updateHeroesList() {
        tableView.reloadData()
    }
}

extension UIImageView {
    
    func loadUrl(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: url), let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
