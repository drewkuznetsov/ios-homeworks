//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 14.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var changeTitelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Chenge Titel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var itemTitel: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile Page"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.view.backgroundColor = .white
        
        let profileHeaderView = ProfileHeaderView(frame: view.bounds)
        itemTitel = profileHeaderView.profileData.name
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(changeTitelButton)
        
        var constraintArray = [NSLayoutConstraint]()
        constraintArray.append(profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor))
        constraintArray.append(profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor))
        constraintArray.append(profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor))
        constraintArray.append(profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor))
        
        constraintArray.append(changeTitelButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor))
        constraintArray.append(changeTitelButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor))
        constraintArray.append(changeTitelButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor))
        constraintArray.append(changeTitelButton.heightAnchor.constraint(equalToConstant: 40))
        
        NSLayoutConstraint.activate(constraintArray)
        
    }
    
    @objc private func buttonPressed() {
        self.navigationItem.title = itemTitel
    }
}
