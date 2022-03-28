//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Views
    
    private lazy var backgroundImageView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.alpha = 0.1
        view.backgroundColor = .white
        view.layer.cornerRadius = imageSize / 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "seagull")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageSize / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .black
        button.isHidden = true
        button.alpha = 0
        button.addTarget(self, action: #selector(hideCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 44
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
        table.register(PhotoCell.self, forCellReuseIdentifier: "PhotoCell")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "DefoltCell")
        table.register(PostCell.self, forCellReuseIdentifier: "PostCell")
       
        return table
    }()
    
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    var imageSize: CGFloat = 120
    
    var widthConstraint = NSLayoutConstraint()
    var heightConstraint = NSLayoutConstraint()
    
    //MARK: - viewDidLoad
    

    override func  viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile Page"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = .white
        
        imageSize = self.view.bounds.width / 4
        
        setupView()
        
    }
    
    private func setupView() {
    
        self.view.addSubview(tableView)
        self.view.addSubview(backgroundImageView)
        self.backgroundImageView.addSubview(imageView)
        self.backgroundImageView.addSubview(closeButton)
        
        self.tapGestureRecognizer.addTarget(self, action: #selector(hideCloseButton))
        self.backgroundImageView.addGestureRecognizer(tapGestureRecognizer)
        
        self.heightConstraint = backgroundImageView.heightAnchor.constraint(equalToConstant: imageSize)
        self.widthConstraint = backgroundImageView.widthAnchor.constraint(equalToConstant: imageSize)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            backgroundImageView.leadingAnchor.constraint(equalTo: self.tableView.leadingAnchor, constant: 16),
            backgroundImageView.topAnchor.constraint(equalTo: self.tableView.contentLayoutGuide.topAnchor, constant: 16),
            self.heightConstraint, self.widthConstraint,
            
            imageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: backgroundImageView.widthAnchor),
            
            closeButton.topAnchor.constraint(equalTo: backgroundImageView.topAnchor,constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -16),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        
        ])
     }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0 : return 1
        case 1 : return 1
        case 2 : return postArray.count
        default: return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            cell.photoDelegat = self
            return cell
            
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
            cell.photoDelegate = self
            return cell
            
        case 2 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
            cell.setupCell(postData: postArray[indexPath.row])
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefoltCell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            self.showPhotoController()
        }
    }

}

protocol  ShowPhoto {
    func showPhotoController()
    func showSelectedPhoto(number: Int)
}

extension ProfileViewController: ShowPhoto {
    func showSelectedPhoto(number: Int) {
        let preview = PhotoPreviewViewController()
        preview.setImage(imageName: photoArray[number])
        self.navigationController?.present(UINavigationController(rootViewController: preview), animated: true, completion: nil)
    }
    
    func showPhotoController() {
        let photoViewController = PhotoViewController()
        self.navigationController?.pushViewController(photoViewController, animated: true)
    }
}

protocol  AnimatePhoto {
    
    func showImagePhoto()
    
}

extension ProfileViewController: AnimatePhoto {
   
    func showImagePhoto() {
        
        self.backgroundImageView.isHidden = false
        self.imageView.isHidden = false
        
        self.widthConstraint.constant = self.view.bounds.width - 32
        self.heightConstraint.constant = self.view.bounds.height - 200
        
        UIView.animate(withDuration: 0.5) {
            self.backgroundImageView.alpha = 8.0
            self.imageView.layer.cornerRadius = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.showCloseButton()
        }
    }
    
    private func showCloseButton() {
        self.closeButton.isHidden = false
        
        UIView.animate(withDuration: 0.3) {
            self.closeButton.alpha = 1
            self.view.layoutIfNeeded()
        } completion: { _ in
           
        }
    }
    
    @objc private func hideCloseButton() {
        
        UIView.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.closeButton.isHidden = true
            self.hideImagePhoto()
        }
    }
    
    private func hideImagePhoto() {
        
        self.widthConstraint.constant = self.imageSize
        self.heightConstraint.constant = self.imageSize
        
        UIView.animate(withDuration: 0.5) {
            self.backgroundImageView.alpha = 0
            self.imageView.layer.cornerRadius = self.imageSize / 2
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.backgroundImageView.isHidden = true
            self.imageView.isHidden = true
        }
    }
    
}
