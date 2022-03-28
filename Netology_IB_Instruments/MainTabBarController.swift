//
//  MainTabBarController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        viewControllers = [
            generateViewController(rootViewController: LogInViewController(), imageVC: "person", titelVC: "Profile"),
            generateViewController(rootViewController: FeedViewController(), imageVC: "house.fill", titelVC: "Feed")
        ]
    }
    
    private func generateViewController(rootViewController: UIViewController, imageVC: String, titelVC: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = UIImage(systemName: imageVC)
        navigationVC.tabBarItem.title = titelVC
        navigationVC.navigationBar.prefersLargeTitles = true
                
        return navigationVC
    }
}

