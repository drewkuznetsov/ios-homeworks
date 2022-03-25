//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 21.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Views
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 44
        table.sectionHeaderHeight = UITableView.automaticDimension
        table.estimatedSectionHeaderHeight = 200
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(ProfileHeader.self, forHeaderFooterViewReuseIdentifier: "ProfileHeader")
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefoltCell", for: indexPath)
            return cell
        }
        
        cell.setupCell(postData: postArray[indexPath.row])

        
        return cell
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 220
        }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
       guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeader") as? ProfileHeader
       else { return nil }
       return view
    }
}
