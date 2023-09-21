//
//  HomeView.swift
//  CoreData-TodoList
//
//  Created by t2023-m0062 on 2023/09/19.
//

import UIKit

class HomeViewController: UIViewController {
    
    let todoListButton : UIButton = {
        let todoListButton = UIButton()
        todoListButton.setTitle("Todo-List", for: .normal)
        todoListButton.translatesAutoresizingMaskIntoConstraints = false
        todoListButton.setTitleColor(.darkGray, for: .normal)
        
        return todoListButton
    }()
    
    let profileButton : UIButton = {
        let profileButton = UIButton()
        profileButton.setTitle("Insta-Profile", for: .normal)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setTitleColor(.darkGray, for: .normal)
        
        return profileButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
    
    }
    
    private func setupUI() {
        view.addSubview(todoListButton)
        view.addSubview(profileButton)
        
        NSLayoutConstraint.activate([
            todoListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoListButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
        
        todoListButton.addTarget(self, action: #selector(todoListbuttonTapped), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(profilebuttonTapped), for: .touchUpInside)
    }
    
    @objc func todoListbuttonTapped() {
        let listVC = ListVC()
        navigationController?.pushViewController(listVC, animated: true)
    }
    
    @objc func profilebuttonTapped() {
        let profileVC = ProfileDesignVC()
        //profileVC.modalPresentationStyle = .fullScreen
        present(profileVC, animated: true, completion: nil)
        
        
    }
}
