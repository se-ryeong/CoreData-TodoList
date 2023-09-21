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
    
    let createDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    let modifyDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        
        return label
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
        addSubview(createDateLabel)
        addSubview(modifyDateLabel)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            createDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            createDateLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
        ])

        NSLayoutConstraint.activate([
            modifyDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            modifyDateLabel.topAnchor.constraint(equalTo: createDateLabel.bottomAnchor, constant: 4),
            modifyDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
}
