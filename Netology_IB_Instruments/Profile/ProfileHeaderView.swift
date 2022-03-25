//
//  ProfileHeaderView.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 21.03.2022.
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
    
    //MARK: - Views
    
    private lazy var profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: profileData.image)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageSize/2
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var statusButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.2863293588, green: 0.523583889, blue: 0.8017535806, alpha: 1)
        button.setTitle(buttonTitle, for: .normal)
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
    
    
    private lazy var nameLable: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = profileData.name
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var statusLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = profileData.status
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var statusTextField: UITextField = {
        
        let textField = UITextField()
        textField.isHidden = true
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.returnKeyType = .done
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        textField.addTarget(self, action: #selector(textChangedEnd), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(textChangedEndExit), for: .editingDidEndOnExit)
        
        return textField
    }()
    
    //MARK: - Lets and Vars
    
    
    private var editStatus: Bool = false
    private var buttonTitle = ButtonState.edit.rawValue

    private var imageSize: CGFloat = 120
    private let buttonHight: CGFloat = 50
    private let edge: CGFloat = 16
    
    private var constraintArray = [NSLayoutConstraint]()
    
    //MARK: - Setup Views
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = .none
        
        self.imageSize = self.frame.width / 3
        
        setupImage()
        setupButton()
        setupLables()
        setupTextField()
        
        NSLayoutConstraint.activate(constraintArray)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    private func setupImage() {

        self.addSubview(profileImageView)
    
        constraintArray.append(profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: edge))
        constraintArray.append(profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edge))
        constraintArray.append(profileImageView.heightAnchor.constraint(equalToConstant: imageSize))
        constraintArray.append(profileImageView.widthAnchor.constraint(equalToConstant: imageSize))
        
    }
    
    private func setupButton() {

        self.addSubview(statusButton)
        
        constraintArray.append(statusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: edge))
        constraintArray.append(statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edge))
        constraintArray.append(statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge))
        constraintArray.append(statusButton.heightAnchor.constraint(equalToConstant: buttonHight))
//        constraintArray.append(statusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -edge))
        
    }
    
    
    private func setupLables() {
        
        self.addSubview(nameLable)
        constraintArray.append(nameLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 27))
        constraintArray.append(nameLable.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: edge))
        constraintArray.append(nameLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge))
        
        self.addSubview(statusLable)
        constraintArray.append(statusLable.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: edge))
        constraintArray.append(statusLable.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34))
        constraintArray.append(statusLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge))
        
    }
    
    private func setupTextField() {
        
        self.addSubview(statusTextField)
        constraintArray.append(statusTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: edge))
        constraintArray.append(statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -30))
        constraintArray.append(statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge))
        constraintArray.append(statusTextField.heightAnchor.constraint(equalToConstant: 40))
    }
    
    //MARK: - Functions
    
    @objc private func buttonPressed() {
        
        editStatus.toggle()

        if editStatus {
            statusTextField.text = profileData.status
            statusTextField.isHidden = false
            buttonTitle = ButtonState.set.rawValue

        } else {
            profileData.status = statusTextField.text ?? profileData.status
            statusTextField.isHidden = true
            buttonTitle = ButtonState.edit.rawValue
            self.endEditing(true)
        }
        
        statusLable.text = profileData.status
        statusButton.setTitle(buttonTitle, for: .normal)
    }
    
    @objc private func textChanged() {
//        print(textField.text!)
    }
    
    @objc private func textChangedEnd() {
        editStatus = false
        statusLable.text = profileData.status
        statusLable.text = profileData.status
        buttonTitle = ButtonState.edit.rawValue
        statusButton.setTitle(buttonTitle, for: .normal)
        statusTextField.isHidden = true
    }
    
    @objc private func textChangedEndExit() {
        profileData.status = statusTextField.text ?? profileData.status
        editStatus = false
        statusLable.text = profileData.status
        statusLable.text = profileData.status
        buttonTitle = ButtonState.edit.rawValue
        statusButton.setTitle(buttonTitle, for: .normal)
        statusTextField.isHidden = true
    }
    
}
