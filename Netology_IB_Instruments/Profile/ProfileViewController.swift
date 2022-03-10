//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 10.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.title = "Profile Page"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.backgroundColor = .lightGray
        
    }
    
    override func viewWillLayoutSubviews() {

        let profileHeader = ProfileHeaderView(frame: view.bounds)

        view.addSubview(profileHeader)

        profileHeader.translatesAutoresizingMaskIntoConstraints = false

        profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        if let bottomAnchor = navigationController?.navigationBar.bottomAnchor {
            profileHeader.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
        } else {
            profileHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        }
        
        if let topAnchor = tabBarController?.tabBar.topAnchor {
            profileHeader.bottomAnchor.constraint(equalTo: topAnchor).isActive = true
        } else {
            profileHeader.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        }

    }

}
