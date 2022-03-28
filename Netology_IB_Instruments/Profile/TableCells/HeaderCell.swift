//
//  HeaderCell.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    private lazy var headerView: ProfileHeaderView = {
        let header = ProfileHeaderView(frame: self.bounds)
        header.animatePhotoDelegate = self
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    var photoDelegat: AnimatePhoto?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .systemGray5
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
       ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
}

extension HeaderCell: AnimatePhoto {
    func showImagePhoto() {
        self.photoDelegat?.showImagePhoto()
    }
    
}
