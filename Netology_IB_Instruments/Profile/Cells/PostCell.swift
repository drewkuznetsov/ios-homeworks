//
//  PostCell.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 21.03.2022.
//

import UIKit

class PostCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 16
        return sv
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var photoView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var disriptionText: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textView.textColor = .systemGray
        textView.numberOfLines = 0
        return textView
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var viewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let edge: CGFloat = 16
    
    private var constraintArray = [NSLayoutConstraint]()
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func prepareForReuse() {
        super.prepareForReuse()
        self.headerLabel.text = nil
        self.photoView.image = nil
        self.disriptionText.text = nil
        self.likesLabel.text = nil
        self.viewLabel.text = nil
    }

    private func setupView() {
        
        self.contentView.addSubview(backView)
        constraintArray.append(backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: edge))
        constraintArray.append(backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0))
        constraintArray.append(backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -edge))
        constraintArray.append(backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0))
        
        backView.addSubview(stackView)
        constraintArray.append(stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor))
        constraintArray.append(stackView.topAnchor.constraint(equalTo: backView.topAnchor,constant: edge))
        constraintArray.append(stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor))

        
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(photoView)
        constraintArray.append(photoView.widthAnchor.constraint(equalTo: backView.widthAnchor))
        constraintArray.append(photoView.heightAnchor.constraint(equalTo: backView.widthAnchor))
        
        stackView.addArrangedSubview(disriptionText)
        
        backView.addSubview(likesLabel)
        constraintArray.append(likesLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor))
        constraintArray.append(likesLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: edge))
        constraintArray.append(likesLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor,constant: -edge))
        
        backView.addSubview(viewLabel)
        constraintArray.append(viewLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: edge))
        constraintArray.append(viewLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor))
        constraintArray.append(viewLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor,constant: -edge))
        
        NSLayoutConstraint.activate(constraintArray)
    }
    
    func setupCell(postData: PostData) {
        self.headerLabel.text = postData.header
        self.photoView.image = UIImage(named: postData.image)
        self.disriptionText.text = postData.description
        self.likesLabel.text = "Likes: \(postData.likes)"
        self.viewLabel.text = "Views: \(postData.views)"
    }
    
}
