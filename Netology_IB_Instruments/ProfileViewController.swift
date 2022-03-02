//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 02.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let subView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            
            let width = self.view.frame.width - 40
            let hight = self.view.frame.height - 40
            
            subView.nameLable.text = "Jonathan Livingston"
            subView.dateLable.text = "30 july 1985"
            subView.cityLable.text = "Moscow"
            
            subView.infoTextView.tintColor = .darkGray
            
            subView.photoImageView.image = UIImage(named: "seagull.jpg")
            
            self.view.addSubview(subView)
            
            subView.frame = CGRect(x: 20, y: 20, width: width, height: hight)
        }
        
    }


}

