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
    
    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let informationLabelsStack: UIStackView = {
        let stackView  = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        return stackView
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.text = "Status:"
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        label.minimumScaleFactor = 0.2
                label.backgroundColor = .yellow
        label.textAlignment = .center
        label.contentMode = .center
        return label
    }()
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.text = "Species:"
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        label.minimumScaleFactor = 0.2
                label.backgroundColor = .green
        label.textAlignment = .center
        label.contentMode = .center
        return label
    }()
    
//    let view2: UIView = {
//        let view = UIView()
//        view.backgroundColor = .systemPink
//        return view
//    }()
    
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
    
    private func setTitleStackView() {
        self.addSubview(titleStackView)
        titleStackView.addArrangedSubview(characterNameView)
        titleStackView.addArrangedSubview(favouriteView)
        titleStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8).isActive = true
        titleStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        titleStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setLineView() {
        self.addSubview(separator)
        separator.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 8).isActive = true
        separator.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        separator.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
    }
    
    private func setInfoLabelsStackView() {
        self.addSubview(informationLabelsStack)
        informationLabelsStack.addSubview(statusLabel)
        informationLabelsStack.addSubview(speciesLabel)
        informationLabelsStack.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8).isActive = true
        informationLabelsStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        informationLabelsStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -200).isActive = true
        informationLabelsStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setAvatarImageView()
        setCharacterNameView()
        setfavouriteButton()
        setCharacterNameLabel()
        setTitleStackView()
        setLineView()
        setInfoLabelsStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
