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
    
    var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        return button
    }()
    
    var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .semibold)
        return label
    }()
    
    func setUpLayout() {
        [favoriteButton, title].forEach { addSubview($0) }
        
        favoriteButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15.0)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20.0)
        }
        
        title.snp.makeConstraints {
            $0.leading.equalTo(favoriteButton.snp.trailing).offset(8.0)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(23.0)
            $0.width.equalTo(150.0)
        }
        
     
        
    }
}


