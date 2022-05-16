//
//  BoardView.swift
//  Heroes messages
//
//  Created by Кирилл on 16.05.2022.
//

import Foundation
import UIKit
import SnapKit

protocol BoardViewDelegate: AnyObject {
    func didTapMessage(_ message: Message)
}

class BoardView: UIView {
    
    weak var delegate: BoardViewDelegate?
    private var dataSource: [Message] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        collection.register(AnswerCell.self, forCellWithReuseIdentifier: String(describing: AnswerCell.self))
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return collection
    }()
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
        setupUI()
    }
    
    func updateMessages(with messages: [Message]) {
        dataSource = messages
        collectionView.reloadData()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(CGFloat(16))
        }
    }
    
    private func removeMessage(for index: Int) {
        dataSource.remove(at: index)
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension BoardView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AnswerCell.self), for: indexPath) as? AnswerCell else { return UICollectionViewCell() }
        
        if let model = dataSource[safe: indexPath.row] {
            cell.configure(with: model.text)
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension BoardView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let message = dataSource[safe: indexPath.row] else { return }
        delegate?.didTapMessage(message)
        removeMessage(for: indexPath.row)
    }
}
