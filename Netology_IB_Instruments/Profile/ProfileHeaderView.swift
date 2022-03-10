//
//  ProfileHeaderView.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 10.03.2022.
//

import UIKit

enum ButtonState: String {
    case show = "Show Status"
    case edit = "Edit Status"
    case set = "Save Status"
}

class ProfileHeaderView: UIView {
    
    var profileData = ProfileData(name: "Jonathan Livingston",
                                  image: "seagull.jpg",
                                  status: "Still flying...")
    
    var profileImageView = UIImageView()
    let statusButton = UIButton()
    let nameLable = UILabel()
    let statusLable = UILabel()
    let textField = UITextField()
    
    private var editStatus: Bool = false
    
    private var buttonTitle = ButtonState.show.rawValue
    
    private var imageSize: CGFloat = 120
    private let buttonHight: CGFloat = 50
    private let edge: CGFloat = 16
    

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = .none
        
        self.imageSize = self.frame.width / 3
        
        setupImage()
        setupButton()
        setupLables()
        setupTextField()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    
    private func setupImage() {
        
        profileImageView.image = UIImage(named: profileData.image)
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = imageSize/2
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.addSubview(profileImageView)

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
    
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: edge).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edge).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        
    }
    
    private func setupButton() {
        
        statusButton.backgroundColor = .blue
        statusButton.setTitle(buttonTitle, for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7

        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.addSubview(statusButton)
        
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: edge).isActive = true
        statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edge).isActive = true
        statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge).isActive = true
        statusButton.heightAnchor.constraint(equalToConstant: buttonHight).isActive = true
        
    }
    
    
    private func setupLables() {
        
        nameLable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLable.textColor = .black
        nameLable.text = profileData.name
        
        self.addSubview(nameLable)
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 27).isActive = true
        nameLable.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: edge).isActive = true
        nameLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge).isActive = true
        
        statusLable.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLable.textColor = .gray
        statusLable.text = profileData.status
        
        self.addSubview(statusLable)
        statusLable.translatesAutoresizingMaskIntoConstraints = false
        statusLable.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: edge).isActive = true
        statusLable.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34).isActive = true
        statusLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge).isActive = true
        
    }
    
    private func setupTextField() {
        
        textField.isHidden = true
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.returnKeyType = .done
        
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: edge).isActive = true
        textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        textField.addTarget(self, action: #selector(textChangedEnd), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(textChangedEndExit), for: .editingDidEndOnExit)
        
        
    }
    
    @objc private func buttonPressed() {
        
        print(self.profileData.status)

        editStatus.toggle()

        if editStatus {
            textField.text = profileData.status
            textField.isHidden = false
            buttonTitle = ButtonState.set.rawValue

        } else {
            profileData.status = textField.text ?? profileData.status
            textField.isHidden = true
            buttonTitle = ButtonState.edit.rawValue
            self.endEditing(true)
        }
        
        statusLable.text = profileData.status
        statusButton.setTitle(buttonTitle, for: .normal)
        self.layoutIfNeeded()
    }
    
    @objc private func textChanged() {
        print(textField.text!)
    }
    
    @objc private func textChangedEnd() {
        editStatus = false
        statusLable.text = profileData.status
        statusLable.text = profileData.status
        buttonTitle = ButtonState.edit.rawValue
        statusButton.setTitle(buttonTitle, for: .normal)
        textField.isHidden = true
        self.layoutIfNeeded()
    }
    
    @objc private func textChangedEndExit() {
        profileData.status = textField.text ?? profileData.status
        editStatus = false
        statusLable.text = profileData.status
        statusLable.text = profileData.status
        buttonTitle = ButtonState.edit.rawValue
        statusButton.setTitle(buttonTitle, for: .normal)
        textField.isHidden = true
        self.layoutIfNeeded()
    }
    
}
