//
//  ProfileHeaderView.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 14.03.2022.
//

import UIKit

import UIKit

enum ButtonState: String {
    case show = "Show Status"
    case edit = "Edit Status"
    case set = "Save Status"
}

class ProfileHeaderView: UIView {
    
    var profileData = ProfileData(name: "Jonathan Livingstone",
                                  image: "seagull.jpg",
                                  status: "Still flying...")
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = edge
        return stackView
    }()
    
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = edge
        return stackView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: profileData.image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageSize/2
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)

        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let textLable = UILabel()
        textLable.text = profileData.name
        textLable.translatesAutoresizingMaskIntoConstraints = false
        textLable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textLable.textColor = .black
//        textLable.backgroundColor = .cyan
        return textLable
    }()
    
    private lazy var statusLabel: UILabel = {
        let textLable = UILabel()
        textLable.text = profileData.status
        textLable.translatesAutoresizingMaskIntoConstraints = false
        textLable.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textLable.textColor = .gray
//        textLable.backgroundColor = .green
        return textLable
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
    
    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
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
    
    private let edge: CGFloat = 16
    private let statusButtonHeight: CGFloat = 50
    private let textFieldHeight: CGFloat = 40
    
    private var imageSize: CGFloat = 120
    private var buttonTitle: String = ButtonState.edit.rawValue
    private var editStatus: Bool = false
    
    
    private var constraintArray = [NSLayoutConstraint]()
    private var topButtonConstraint = NSLayoutConstraint()

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.imageSize = self.frame.width / 3
        
        self.backgroundColor = .systemGray4
        
        self.addSubview(profileStackView)
        self.addSubview(statusButton)
        self.addSubview(statusTextField)
        
        profileStackView.addArrangedSubview(profileImageView)
        profileStackView.addArrangedSubview(infoStackView)
        
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(statusLabel)
        
        constraintArray.append(profileImageView.heightAnchor.constraint(equalToConstant: imageSize))
        constraintArray.append(profileImageView.widthAnchor.constraint(equalToConstant: imageSize))
        
        constraintArray.append(profileStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: edge))
        constraintArray.append(profileStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edge))
        constraintArray.append(profileStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge))
        
        constraintArray.append(statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edge))
        constraintArray.append(statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge))
        constraintArray.append(statusButton.heightAnchor.constraint(equalToConstant: statusButtonHeight))
        
        topButtonConstraint = statusButton.topAnchor.constraint(equalTo: profileStackView.bottomAnchor, constant: edge)
        
        constraintArray.append(statusTextField.topAnchor.constraint(equalTo: profileStackView.bottomAnchor, constant: edge))
        constraintArray.append(statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edge))
        constraintArray.append(statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -edge))
        constraintArray.append(statusTextField.heightAnchor.constraint(equalToConstant: textFieldHeight))
        
        topButtonConstraint.isActive = true
        NSLayoutConstraint.activate(constraintArray)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
        editStatus = false
        topButtonConstraint.isActive = false
        topButtonConstraint.constant = edge
        statusTextField.isHidden = true
        buttonTitle = ButtonState.edit.rawValue
        statusButton.setTitle(buttonTitle, for: .normal)
        topButtonConstraint.isActive = true
    }
    
    @objc private func buttonPressed() {
    
        editStatus.toggle()
        topButtonConstraint.isActive = false

        if editStatus {
            statusTextField.text = profileData.status
            statusTextField.isHidden = false
            buttonTitle = ButtonState.set.rawValue
            topButtonConstraint.constant = edge * 2 + textFieldHeight
        } else {
            profileData.status = statusTextField.text ?? profileData.status
            statusTextField.isHidden = true
            buttonTitle = ButtonState.edit.rawValue
            self.endEditing(true)
            topButtonConstraint.constant = edge
        }

        statusLabel.text = profileData.status
        statusButton.setTitle(buttonTitle, for: .normal)
        topButtonConstraint.isActive = true
        
    }
    
    @objc private func textChanged() {
        statusLabel.text = statusTextField.text ?? profileData.status
    }
    
    @objc private func textChangedEnd() {
        topButtonConstraint.isActive = false
        topButtonConstraint.constant = edge
        editStatus = false
        statusLabel.text = profileData.status
        statusLabel.text = profileData.status
        buttonTitle = ButtonState.edit.rawValue
        statusButton.setTitle(buttonTitle, for: .normal)
        statusTextField.isHidden = true
        topButtonConstraint.isActive = true
//        self.layoutIfNeeded()
    }
    
    @objc private func textChangedEndExit() {
        profileData.status = statusTextField.text ?? profileData.status
        editStatus = false
        statusLabel.text = profileData.status
        statusLabel.text = profileData.status
        buttonTitle = ButtonState.edit.rawValue
        statusButton.setTitle(buttonTitle, for: .normal)
        statusTextField.isHidden = true
        self.layoutIfNeeded()
    }
    
}
