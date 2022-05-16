//
//  InputChatCell.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

final class InputChatCell: UITableViewCell {
 
    // UI
    private lazy var container = UIView()
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupUI() {
        addSubview(container)
        container.layer.cornerRadius = 8
        container.backgroundColor = .gray
        
        container.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(CGFloat(16))
            $0.top.bottom.equalToSuperview().inset(CGFloat(16))
            $0.width.lessThanOrEqualTo(CGFloat(500))
        }
        
        container.addSubview(title)
        title.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview().inset(CGFloat(16))
        }
    }
    
    override func prepareForReuse() {
        title.text = nil
    }
}
