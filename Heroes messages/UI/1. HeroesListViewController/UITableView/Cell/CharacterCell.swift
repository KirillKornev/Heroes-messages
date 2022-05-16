//
//  CharacterCell.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit
import SnapKit

final class CharacterCell: UITableViewCell {
    
    // UI
    lazy var logo = UIImageView()
    lazy var title = UILabel()
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    private lazy var logoContainer: UIView = {
        let view = UIView()
        view.addSubview(logo)
        logo.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.top.bottom.equalToSuperview()
            $0.width.equalTo(CGFloat(200))
            $0.height.equalTo(CGFloat(200))
        }
        logo.layer.cornerRadius = 8
        return view
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
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.leading.top.bottom.trailing.equalToSuperview()
        }
        
        stack.addArrangedSubview(logoContainer)
        stack.addArrangedSubview(title)
    }
    
    override func prepareForReuse() {
        title.text = nil
        logo.image = nil
    }
}
