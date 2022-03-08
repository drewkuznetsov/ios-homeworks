//
//  CustomButton.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 08.03.2022.
//

import UIKit

class CustomButton: UIButton {

    let buttonWidth: CGFloat = 100
    let buttonHight: CGFloat = 50
    
    init(center: CGPoint, textTitle: String) {
        
        let x = center.x - buttonWidth/2
        let y = center.y - buttonHight/2
        
        let frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHight)
        
        super.init(frame: frame)
        
        self.backgroundColor = .blue
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        
        self.setTitle(textTitle, for: .normal)
        self.setTitleColor(.white , for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//    button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
//    return button

}
