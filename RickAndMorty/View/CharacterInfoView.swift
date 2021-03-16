//
//  CharacterInfoView.swift
//  RickAndMorty
//
//  Created by Peterses on 16/03/2021.
//

import Foundation
import UIKit

class CharacterInfoView: UIView {
    
    let avatarImageView: UIImageView = {
        let imageUrl = URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!
        var image = UIImage()
        if let data = try? Data(contentsOf: imageUrl) {
            image = UIImage(data: data)!
        }
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30.0, weight: .heavy)
        label.textColor = .black
        label.text = "Rick Sanchez"
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        label.minimumScaleFactor = 0.2
//        label.backgroundColor = .yellow
        label.textAlignment = .center
        label.contentMode = .center
        return label
    }()
    
    let favuriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(scale: .large)
        let icon = UIImage(systemName: "heart", withConfiguration: largeConfig)
        button.setImage(icon, for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .systemRed
        button.isSelected = false
//        button.backgroundColor = .blue
        return button
    }()
    
    let characterNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemPink
        return view
    }()
    
    let favouriteView: UIView = {
        let view = UIView()
//        view.backgroundColor = .green
        return view
    }()
    
    var titleStackView: UIStackView = {
        let stackView  = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private func setAvatarImageView() {
        self.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    private func setCharacterNameView() {
        characterNameView.addSubview(characterNameLabel)
    }
    
    private func setCharacterNameLabel() {
        characterNameLabel.centerYAnchor.constraint(equalTo: characterNameView.centerYAnchor).isActive = true
        characterNameLabel.leftAnchor.constraint(equalTo: characterNameView.leftAnchor, constant: 0).isActive = true
        characterNameLabel.rightAnchor.constraint(equalTo: characterNameView.rightAnchor, constant: 0).isActive = true
    }
    

    private func setfavouriteButton() {
        favouriteView.addSubview(favuriteButton)
        favuriteButton.centerYAnchor.constraint(equalTo: favouriteView.centerYAnchor).isActive = true
        favuriteButton.centerXAnchor.constraint(equalTo: favouriteView.centerXAnchor).isActive = true
    }
    
    private func setStackView() {
        self.addSubview(titleStackView)
        titleStackView.addArrangedSubview(characterNameView)
        titleStackView.addArrangedSubview(favouriteView)
        titleStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8).isActive = true
        titleStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        titleStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setAvatarImageView()
        setCharacterNameView()
        setfavouriteButton()
        setCharacterNameLabel()
        setStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
