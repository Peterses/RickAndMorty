//
//  CharacterInfoView.swift
//  RickAndMorty
//
//  Created by Peterses on 16/03/2021.
//

import Foundation
import UIKit
import Nuke

class CharacterInfoView: UIView {
    
    // Inicjalizuje się tylko wtedy gdy jest potrzebne
    // inicjalizuje się tylko raz
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 550
        return imageView
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30.0, weight: .heavy)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        label.minimumScaleFactor = 0.2
        label.textAlignment = .center
        label.contentMode = .center
        return label
    }()
    
    private lazy var favuriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(scale: .large)
        let icon = UIImage(systemName: "heart", withConfiguration: largeConfig)
        button.setImage(icon, for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .systemRed
        button.isSelected = false
        return button
    }()
    
    private lazy var characterNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var favouriteView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView  = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    // MapKit
    // ConstaintBuilder
    private lazy var characterSpecsLabels: [UILabel] = {
        let names = ["Status:", "Species:", "Type:", "Gender:", "Origin:", "Episodes:"]
        var labels: [UILabel] = []
        
        names.forEach { (name) in
            let label = UILabel()
            label.text = name
            labels.append(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 16, weight: .bold)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            label.baselineAdjustment = .alignCenters
            label.minimumScaleFactor = 0.2
            label.textAlignment = .left
            label.contentMode = .center
        }
        return labels
    }()
    
    private lazy var statusLabelData: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.text = "Status:"
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        label.minimumScaleFactor = 0.2
        label.textAlignment = .left
        label.contentMode = .center
        return label
    }()
    
    private lazy var speciesLabelData: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .left
        label.contentMode = .center
        return label
    }()
    
    
    private lazy var typeLabelData: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .left
        label.contentMode = .center
        return label
    }()
    
    private lazy var genderLabelData: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .left
        label.contentMode = .center
        return label
    }()
    
    private lazy var originLabelData: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .left
        label.contentMode = .center
        return label
    }()
    
    private lazy var locationLabelData: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .left
        label.contentMode = .center
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView  = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var informationLabelsStack: UIStackView = {
        let stackView  = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var informationLabelsStack2: UIStackView = {
        let stackView  = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private func setInfoLabelsStackView() {
        characterSpecsLabels.forEach { (label) in
            informationLabelsStack.addArrangedSubview(label)
        }
    }
    
    private func setInfoLabelsStackView2() {
        informationLabelsStack2.addArrangedSubview(statusLabelData)
        informationLabelsStack2.addArrangedSubview(speciesLabelData)
        informationLabelsStack2.addArrangedSubview(typeLabelData)
        informationLabelsStack2.addArrangedSubview(genderLabelData)
        informationLabelsStack2.addArrangedSubview(locationLabelData)
    }
    
    private func setHorizontalStackView() {
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(informationLabelsStack)
        horizontalStackView.addArrangedSubview(informationLabelsStack2)
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            horizontalStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 26),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    private func setCharacterNameView() {
        
    }
    
    private func setCharacterNameLabel() {
        NSLayoutConstraint.activate([
            characterNameLabel.centerYAnchor.constraint(equalTo: characterNameView.centerYAnchor),
            characterNameLabel.leftAnchor.constraint(equalTo: characterNameView.leftAnchor, constant: 0),
            characterNameLabel.rightAnchor.constraint(equalTo: characterNameView.rightAnchor, constant: 0)
        ])
    }
    
    
    private func setfavouriteButton() {
        NSLayoutConstraint.activate([
            favuriteButton.centerYAnchor.constraint(equalTo: favouriteView.centerYAnchor),
            favuriteButton.centerXAnchor.constraint(equalTo: favouriteView.centerXAnchor)
        ])
    }
    
    private func setTitleStackView() {
        titleStackView.addArrangedSubview(characterNameView)
        titleStackView.addArrangedSubview(favouriteView)
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8),
            titleStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setLineView() {
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 8),
            separator.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            separator.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    private func addSubViews() {
        addSubview(separator)
        addSubview(avatarImageView)
        characterNameView.addSubview(characterNameLabel)
        addSubview(titleStackView)
        favouriteView.addSubview(favuriteButton)
    }
    
    private func setAvatarImageView() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            avatarImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            avatarImageView.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        layoutSubviews()
        setInfoLabelsStackView2()
        setHorizontalStackView()
        setAvatarImageView()
        setCharacterNameView()
        setfavouriteButton()
        setCharacterNameLabel()
        setTitleStackView()
        setLineView()
        setInfoLabelsStackView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(characterName: String, status: String, species: String, type: String, gender: String, origin: String, location: String, imageUrl: String) {
        characterNameLabel.text = !characterName.isEmpty ? characterName : "-"
        statusLabelData.text = !status.isEmpty ? status : "-"
        speciesLabelData.text = !species.isEmpty ? species : "-"
        typeLabelData.text = !type.isEmpty ? type : "-"
        genderLabelData.text = !gender.isEmpty ? gender : "-"
        originLabelData.text = !origin.isEmpty ? origin : "-"
        locationLabelData.text = !location.isEmpty ? location : "-"
        
        let imageUrl = URL(string: imageUrl)!
        Nuke.loadImage(with: imageUrl, into: self.avatarImageView)
        UIView.animate(withDuration: 0.5) {
            self.avatarImageView.layer.cornerRadius = 0
        }
    }
}
