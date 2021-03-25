//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Peterses on 19/03/2021.
//

import Foundation
import UIKit
import Nuke

class CharacterTableViewCell: UITableViewCell, Identifiable {
    
    private lazy var characterImage: UIImageView = {
        let image = UIImage(named: "questionMark")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setCharacterImage() {
        addSubview(characterImage)
        NSLayoutConstraint.activate([
            characterImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            characterImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            characterImage.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            characterImage.widthAnchor.constraint(lessThanOrEqualToConstant: 60)
        ])
    }
    
    private func setLabel() {
        addSubview(characterNameLabel)
        NSLayoutConstraint.activate([
            characterNameLabel.leftAnchor.constraint(equalTo: characterImage.rightAnchor, constant: 20.0),
            characterNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: CharacterTableViewCell.identifier)
        setCharacterImage()
        setLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(characterName: String, imageUrl: String) {
        characterNameLabel.text = characterName
        let imageUrl = URL(string: imageUrl)!
        Nuke.loadImage(with: imageUrl, into: characterImage)
    }
}
