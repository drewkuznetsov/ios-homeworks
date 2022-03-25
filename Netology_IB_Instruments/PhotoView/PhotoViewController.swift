//
//  PhotoViewController.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import UIKit

class PhotoViewController: UIViewController {
    
    private enum Constant {
        static let numberOfItems: CGFloat = 3
        static let minimumSpacing: CGFloat = 8
    }
    
    //MARK: - Views
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = Constant.minimumSpacing
        layout.minimumLineSpacing = Constant.minimumSpacing
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefoltCell")
        collection.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationItem.title = "Photo Gallery"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: Constant.minimumSpacing),
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Constant.minimumSpacing),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.minimumSpacing),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.minimumSpacing)
        ])
    }
    
    private func countSize(width: CGFloat) -> CGSize {
        
        let size: CGFloat = floor((width - Constant.minimumSpacing * (Constant.numberOfItems - 1)) / Constant.numberOfItems)
        return CGSize(width: size, height: size)
    }
    
}

extension PhotoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        23
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefoltCell", for: indexPath)
            let image = UIImageView(frame: cell.bounds)
            image.image = UIImage(named: photoArray[indexPath.item])
            cell.contentView.addSubview(image)
            return cell
        }
        cell.setImage(number: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return countSize(width: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let preview = PhotoPreviewViewController()
        preview.setImage(imageName: photoArray[indexPath.item])
        self.navigationController?.present(UINavigationController(rootViewController: preview), animated: true, completion: nil)
    }
}
