//
//  ToDoCell.swift
//  Todoey
//
//  Created by YUJIN KWON on 2023/01/04.
//

import SnapKit
import UIKit

class ToDoCell: UITableViewCell {
    static let identifier = "TodoCell"
    
    private lazy var label:  UILabel = {
        let label = UILabel()
        label.text = "What to do"
        label.font = .systemFont(ofSize: 20.0, weight: .semibold)
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .tertiaryLabel
        return image
    }()
    
    func setUpLayout() {
        [label, image].forEach { addSubview($0) }
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10.0)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(23.0)
            $0.width.equalTo(150.0)
        }
        
        image.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(label.snp.trailing).offset(8.0)
            $0.trailing.equalToSuperview().inset(10.0)
            $0.height.equalTo(23.0)
        }
        
    }
}


