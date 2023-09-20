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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        view.addSubview(todoListButton)
        
        NSLayoutConstraint.activate([
            todoListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoListButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
        
        todoListButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        let listVC = ListVC()
        navigationController?.pushViewController(listVC, animated: true)
    }
    
}
