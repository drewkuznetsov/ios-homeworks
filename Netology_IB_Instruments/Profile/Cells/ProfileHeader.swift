//
//  ProfileHeader.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 21.03.2022.
//

import UIKit

class ProfileHeader: UITableViewHeaderFooterView {

    override func draw(_ rect: CGRect) {
        // Drawing code
        let profileView = ProfileHeaderView(frame: rect)
        self.contentView.addSubview(profileView)

        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
}
