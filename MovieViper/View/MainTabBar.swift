//
//  TabBar.swift
//  MovieViper
//
//  Created by hossein on 9/29/1401 AP.
//

import UIKit

class MainTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    
    func setupVCs() {
        let vc = ListRouter.setupModule()
        let vc2 = FavoriteRouter.setupModule()
        
        viewControllers = [
            createNavController(for: vc, title: NSLocalizedString("Home", comment: ""), image: UIImage(named: "tab_home")!),
            createNavController(for: vc2, title: NSLocalizedString("Favorite", comment: ""), image: UIImage(named: "tab_favorite")!)
        ]
    }
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
}
