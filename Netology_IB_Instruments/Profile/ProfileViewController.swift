//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Views
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 44
//        table.sectionHeaderHeight = UITableView.automaticDimension
//        table.estimatedSectionHeaderHeight = 200
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        
//        table.register(ProfileHeader.self, forHeaderFooterViewReuseIdentifier: "ProfileHeader")
        table.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
        table.register(PhotoCell.self, forCellReuseIdentifier: "PhotoCell")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "DefoltCell")
        table.register(PostCell.self, forCellReuseIdentifier: "PostCell")
       
        return table
    }()
    
    
    
    //MARK: - viewDidLoad
    

    override func  viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile Page"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = .white
        
        setupView()
        
    }
    
    private func setupView() {
    
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
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
