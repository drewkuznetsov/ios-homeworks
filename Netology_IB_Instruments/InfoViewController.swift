//
//  InfoViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 08.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private var alertButton: UIButton {
       
        let button = CustomButton(center: view.center, textTitle: "Show Alert")
        button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
        return button
    }
    
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
