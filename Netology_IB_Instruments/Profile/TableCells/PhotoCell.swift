//
//  PhotoCell.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    private enum Constant {
        static let numberOfItems: CGFloat = 4
        static let minimumSpacing: CGFloat = 8
        static let edge: CGFloat = 12
    }
    
    var photoDelegate: ShowPhoto?
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = Constant.minimumSpacing
        layout.minimumLineSpacing = Constant.minimumSpacing
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefoltCell")
        collection.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        return collection
    }()
    
    private lazy var photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var photoButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)

        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTaped), for: .touchUpInside)
        return button
    }()
    
    var height: CGFloat = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.contentView.backgroundColor = .systemGray5
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

//        self.photoDelegate?.showPhoto()
    }
    
    private func setupView() {
        
        self.contentView.addSubview(backView)
        backView.addSubview(photoLabel)
        backView.addSubview(photoButton)
        backView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.edge),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.edge),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.edge),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.edge),
            backView.heightAnchor.constraint(equalToConstant: 120),
            
            photoLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            photoLabel.topAnchor.constraint(equalTo: backView.topAnchor),
            
            photoButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            photoButton.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: Constant.edge),
            collectionView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
        ])
    }
    
    private func countSize(width: CGFloat) -> CGSize {
        let size: CGFloat = floor((width - Constant.minimumSpacing * (Constant.numberOfItems - 1)) / Constant.numberOfItems)
        return CGSize(width: size, height: size)
    }
    
    @objc func buttonTaped() {
        self.photoDelegate?.showPhotoController()
    }
}

extension PhotoCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 23
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefoltCell", for: indexPath)
            let image = UIImageView(frame: cell.bounds)
            image.image = UIImage(named: photoArray[indexPath.row])
            cell.contentView.addSubview(image)
            return cell
        }
        cell.setImage(number: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return countSize(width: collectionView.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.photoDelegate?.showSelectedPhoto(number: indexPath.item)
    }
    
}
