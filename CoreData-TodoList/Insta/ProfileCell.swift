//
//  ProfileCell.swift
//  CoreData-TodoList
//
//  Created by t2023-m0062 on 2023/09/22.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    static let identifier = "ProfileCell"
    
    let feedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "picture1")
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(feedImageView)
        
        NSLayoutConstraint.activate([
            feedImageView.topAnchor.constraint(equalTo: topAnchor),
            feedImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            feedImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            feedImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
