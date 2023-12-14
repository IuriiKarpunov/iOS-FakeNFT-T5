//
//  FavoriteNftsCollectionViewCell.swift
//  FakeNFT
//
//  Created by Aleksey Kolesnikov on 12.12.2023.
//

import UIKit

final class FavoriteNftsCollectionViewCell: UICollectionViewCell {
    static let cellName = "favoriteNftsCell"
    
    //MARK: - Layout variables
    private lazy var nftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    private lazy var likeButton: UIButton = {
        let imageButton = UIImage(named: "No active")
        
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 12
        button.setImage(imageButton, for: .normal)
        button.addTarget(self, action: #selector(changeLike), for: .touchUpInside)
        
        return button
    }()
    private lazy var ratingImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "stars3"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .ypBlackDay
        
        return label
    }()
    private lazy var costLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .ypBlackDay
        label.text = "1,78 ETH"
        
        return label
    }()
    
    //MARK: - Main function
    func configureCell(name: String) {
        backgroundColor = .ypWhiteDay
        
        nameLabel.text = name
        
        addSubViews()
        configureConstraints()
    }
}

//MARK: - Private functions
private extension FavoriteNftsCollectionViewCell {
    func addSubViews() {
        contentView.addSubview(nftImageView)
        contentView.addSubview(likeButton)
        contentView.addSubview(ratingImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(costLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            nftImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nftImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nftImageView.widthAnchor.constraint(equalToConstant: 80),
            
            likeButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor),
            likeButton.topAnchor.constraint(equalTo: nftImageView.topAnchor),
            
            ratingImageView.leadingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: 12),
            ratingImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: ratingImageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: ratingImageView.topAnchor, constant: -4),
            
            costLabel.topAnchor.constraint(equalTo: ratingImageView.bottomAnchor, constant: 8),
            costLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            costLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            costLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc
    func changeLike() {
        
    }
}
