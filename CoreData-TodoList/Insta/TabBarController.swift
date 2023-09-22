//
//  TabBarController.swift
//  CoreData-TodoList
//
//  Created by t2023-m0062 on 2023/09/22.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        let profileController = UINavigationController(rootViewController: ProfileDesignVC())
        
        profileController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Profile - Fill"), selectedImage: UIImage(named: "Profile - Fill"))
        
        viewControllers = [profileController]
        TabbarAppearance()
    }
    
    func TabbarAppearance() {
        UITabBar.appearance().tintColor = .black
    }
}
