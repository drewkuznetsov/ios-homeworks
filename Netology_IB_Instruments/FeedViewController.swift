//
//  FeedViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 08.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private var readButton: UIButton {
        
        let button = CustomButton(center: view.center,textTitle: "View Post")
        button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
        return button
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Feed Page"
        
        view.addSubview(self.readButton)
        
    }
    
    @objc private func didTabButton() {
        
        let postTitel = "First Post"
        let postText = "This is my first post here!"
        let post = Post(titel: postTitel, text: postText)
        
        let postVC = PostViewController()
        postVC.post = post
        
        self.navigationController?.pushViewController(postVC, animated: true)
        
    }
}
