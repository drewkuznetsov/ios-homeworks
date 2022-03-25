//
//  PhotoPreviewViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class PhotoPreviewViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var imageName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        
        self.view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8),
            imageView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -16),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
    }
    
    private func setupNavigation() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.view.backgroundColor = .white
        
        let exitButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(exitButtonTapped))
        let shareButton = UIBarButtonItem(title: "Share", style: .done, target: self, action: #selector(shareButtonTaped))
        
        self.navigationItem.setLeftBarButton(exitButton, animated: true)
        self.navigationItem.setRightBarButton(shareButton, animated: true)
    }
    
    @objc private func exitButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func shareButtonTaped() {
        let shareControler = UIActivityViewController(activityItems: [UIImage(named: imageName)!], applicationActivities: nil)
        present(shareControler, animated: true, completion: nil)
    }
    
    func setImage(imageName: String) {
        self.imageName = imageName
        self.imageView.image = UIImage(named: imageName)
        self.navigationItem.title = imageName
    }
}
