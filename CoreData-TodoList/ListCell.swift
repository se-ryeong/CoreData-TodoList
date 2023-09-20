//
//  ListCell.swift
//  CoreData-TodoList
//
//  Created by t2023-m0062 on 2023/09/19.
//

import UIKit
import CoreData

class ListCell: UITableViewCell {
    static let identifier = "ListCell"
    
    let title : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = ""
        title.font = UIFont.systemFont(ofSize: 15)
        title.textColor = .black
        
        return title
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            title.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
