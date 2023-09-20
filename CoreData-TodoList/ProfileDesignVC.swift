//
//  ProfileDesignVC.swift
//  CoreData-TodoList
//
//  Created by t2023-m0062 on 2023/09/20.
//

import UIKit

class ProfileDesignVC: UIViewController {
    let username: UILabel = {
        let username = UILabel()
        username.text = "nabaecamp"
        username.font = UIFont.boldSystemFont(ofSize: 18)
        username.textColor = .black
        username.translatesAutoresizingMaskIntoConstraints = false
        username.textAlignment = .center
        
        return username
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.addSubview(username)
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
}
