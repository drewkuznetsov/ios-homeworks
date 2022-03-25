//
//  PhotoCollectionViewCell.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        return photo
    }()
 
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.contentView.addSubview(backView)
        backView.addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            photoImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            photoImageView.topAnchor.constraint(equalTo: backView.topAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.photoImageView.image = nil
    }
    
    func setImage(number: Int) {
        self.photoImageView.image = UIImage(named: photoArray[number])
    }
}
