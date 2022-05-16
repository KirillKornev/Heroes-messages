//
//  AnswerCell.swift
//  Heroes messages
//
//  Created by Кирилл on 16.05.2022.
//

import Foundation
import UIKit
import SnapKit

final class AnswerCell: UICollectionViewCell {
    
    // UI
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        setupUI()
     }
    
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
     }
    
    func configure(with text: String) {
        label.text = text
    }
    
    // MARK: - Private
    
    private func setupUI() {
        container.backgroundColor = .blue
        addSubview(container)
        container.snp.makeConstraints {
            $0.leading.trailing.bottom.top.equalToSuperview()
        }
        container.layer.cornerRadius = 8
        
        container.addSubview(label)
        label.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview().inset(CGFloat(8))
        }
    }
}
