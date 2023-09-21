//
//  InfoView.swift
//  CoreData-TodoList
//
//  Created by t2023-m0062 on 2023/09/21.
//

import UIKit

class InfoView: UIStackView {
    let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        self.addSubview(numberLabel)
        self.addSubview(nameLabel)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            numberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 4),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
