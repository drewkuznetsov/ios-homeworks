//
//  PostViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    var postData = PostDataOld(titel: "Post View", text: "")
    
    var textView: UITextView {
        let tup: CGFloat = 40
        let width: CGFloat = view.frame.width - tup
        let hight: CGFloat = 100
        let x = view.center.x - width/2
        let y = view.center.y - hight/2
        let frame = CGRect(x: x, y: y, width: width, height: hight)
        
        let tempTextView = UITextView(frame: frame)
        tempTextView.backgroundColor = .white
        tempTextView.text = postData.text
        tempTextView.font = UIFont(name: "Futura", size: 24)
        
        return tempTextView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray3
        
        navigationItem.title = postData.titel
        view.addSubview(textView)
        
        let infoBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(showInfo))
        self.navigationItem.rightBarButtonItem = infoBarButtonItem
    }
    
    @objc private func showInfo() {
        
        let infoNC = UINavigationController(rootViewController: InfoViewController())
        self.present(infoNC, animated: true, completion: nil)
    }
}
