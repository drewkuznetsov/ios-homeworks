//
//  FeedViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    lazy var postButtonOne: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Post One", for: .normal)
        button.tag = 1
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    lazy var postButtonTwo: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Post Two", for: .normal)
        button.tag = 2
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var postLableOne: UILabel = {
        let lable = UILabel()
        lable.text = "Read Poste One:"
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lable.textColor = .black
        return lable
    }()
    
    lazy var postLableTwo: UILabel = {
        let lable = UILabel()
        lable.text = "Read Poste Two:"
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lable.textColor = .black
        return lable
    }()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Feed Page"
        
        view.addSubview(self.stackView)
        stackView.addArrangedSubview(postLableOne)
        stackView.addArrangedSubview(postButtonOne)
        stackView.addArrangedSubview(postLableTwo)
        stackView.addArrangedSubview(postButtonTwo)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
    }
    
    @objc private func buttonPressed(sender: UIButton) {
        
        var post = PostDataOld(titel: "", text: "")
        
        if sender.tag == 1 {
            post.titel = "First Post"
            post.text = "This is my first post here!"
        } else if sender.tag == 2 {
            post.titel = "Second Post"
            post.text = "This is my second post here!"
        }
        
        let postVC = PostViewController()
        postVC.postData = post
        
        self.navigationController?.pushViewController(postVC, animated: true)
        
    }
}
