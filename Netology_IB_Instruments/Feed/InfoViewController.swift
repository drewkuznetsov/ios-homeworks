//
//  InfoViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var alertButton: UIButton = {
    
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Show Alert", for: .normal)
        button.tag = 1
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        
        button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.title = "Info"
        
        view.addSubview(alertButton)
    }
    
    @objc private func didTabButton() {
        
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cansel", comment: "Cansel action"), style: .default, handler: { _ in
        NSLog("The \"Cansel\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
