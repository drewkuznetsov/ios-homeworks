//
//  FeedViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 08.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private var readButton: UIButton {
        let buttonWidth: CGFloat = 100
        let buttonHight: CGFloat = 50
        let x = view.center.x - buttonWidth/2
        let y = view.center.y - buttonHight/2
        let frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHight)
        
        let button = UIButton(frame: frame)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.setTitle("View Post", for: .normal)
        button.setTitleColor(.white , for: .normal)
        
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
