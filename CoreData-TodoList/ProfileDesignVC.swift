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
    
    let menu: UIImageView = {
        let menu = UIImageView()
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.image = UIImage(named: "Menu")
        menu.contentMode = .scaleAspectFit
        
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        setUI()
        menulayout()
    }
    
    func addSubViews() {
        view.addSubview(username)
        view.addSubview(menu)

    }
    
    private func setUI() {
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func menulayout() {
        NSLayoutConstraint.activate([
            //menu.centerXAnchor.constraint(equalTo: username.centerXAnchor),
            menu.centerYAnchor.constraint(equalTo: username.centerYAnchor),
            menu.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        
        ])
    }
}
