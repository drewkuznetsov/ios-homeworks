//
//  LogInViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - UIViews
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo.png")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        
        stack.clipsToBounds = true
        stack.backgroundColor = .gray
        stack.spacing = 1
        stack.layer.cornerRadius = 10
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.gray.cgColor
        return stack
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        let leftView = UIView(frame: CGRect( x: 0, y: 0, width: 10, height: 2))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.placeholder = "LogIn"
        textField.backgroundColor = .systemGray6
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.returnKeyType = .done
        
        textField.addTarget(self, action: #selector(textEdit), for: .editingChanged)
        textField.addTarget(self, action: #selector(loginTextDidEnd), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(loginTextExit), for: .editingDidEndOnExit)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        let leftView = UIView(frame: CGRect( x: 0, y: 0, width: 10, height: 2))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.returnKeyType = .done
        
        textField.addTarget(self, action: #selector(textEdit), for: .editingChanged)
        textField.addTarget(self, action: #selector(passwordTextDidEnd), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(passwordTextExit), for: .editingDidEndOnExit)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray5
        button.setImage(UIImage(named: "blue_pixel.png"), for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Constants and Varibals
    
    private let imageSize: CGFloat = 100
    private let edge: CGFloat = 16
        
    private var constraintArray = [NSLayoutConstraint]()
    
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "LogIn Page"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.view.backgroundColor = .white
        

        
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.contentView.endEditing(true)
    }
    
    //MARK: - View Setup
    
    private func setupView() {
        
        self.view.addSubview(scrollView)
        constraintArray.append(scrollView.topAnchor.constraint(equalTo: self.view.topAnchor))
        constraintArray.append(scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor))
        constraintArray.append(scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor))
        constraintArray.append(scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0))
        
        scrollView.addSubview(contentView)
        constraintArray.append(contentView.topAnchor.constraint(equalTo: scrollView.topAnchor))
        constraintArray.append(contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor))
        constraintArray.append(contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
        constraintArray.append(contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor))
        
        setupContentView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func setupContentView() {
        
        constraintArray.append(contentView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor))
        
        contentView.addSubview(imageView)
        constraintArray.append(imageView.widthAnchor.constraint(equalToConstant: imageSize))
        constraintArray.append(imageView.heightAnchor.constraint(equalToConstant: imageSize))
        constraintArray.append(imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor))
        constraintArray.append(imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120))
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        constraintArray.append(stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: edge))
        constraintArray.append(stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70))
        constraintArray.append(stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -edge))
        constraintArray.append(stackView.heightAnchor.constraint(equalToConstant: 100))
        
        contentView.addSubview(loginButton)
        constraintArray.append(loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: edge))
        constraintArray.append(loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: edge))
        constraintArray.append(loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -edge))
        constraintArray.append(loginButton.heightAnchor.constraint(equalToConstant: 50))
        constraintArray.append(loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -edge))
        
        NSLayoutConstraint.activate(constraintArray)
    }
    
    //MARK: - Functions
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        
        loginTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
        self.scrollView.contentOffset = .zero
    }
    
    @objc private func didTapButton() {
        let profileView = ProfileViewController()
        self.navigationController?.pushViewController(profileView, animated: true)
    }
    
    @objc private func textEdit() {
        if let b1 = loginTextField.text?.isEmpty, let b2 = passwordTextField.text?.isEmpty {
//            loginButton.isHidden = b1 || b2
            if !(b1 || b2) {
                loginButton.backgroundColor = #colorLiteral(red: 0.2863293588, green: 0.523583889, blue: 0.8017535806, alpha: 1)
                loginButton.isEnabled = true
            } else {
                loginButton.backgroundColor = .systemGray5
                loginButton.isEnabled = false
            }
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        guard
            let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue
        else {
            return
        }
        
        self.scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrame.cgRectValue.height)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
       
        self.scrollView.contentOffset = .zero
    }
    
    @objc private func loginTextDidEnd() {
        loginTextField.endEditing(true)
    }
    
    @objc private func passwordTextDidEnd() {
        passwordTextField.endEditing(true)
    }
    
    @objc private func loginTextExit() {
        loginTextField.endEditing(true)
    }
    
    @objc private func passwordTextExit() {
        passwordTextField.endEditing(true)
    }
    
    @objc private func forcedHideKeyboard() {
        loginTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
}
