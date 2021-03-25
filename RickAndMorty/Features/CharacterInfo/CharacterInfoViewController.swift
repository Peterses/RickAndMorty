//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Peterses on 16/03/2021.
//

import UIKit

class CharacterInfoViewController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    var mainView = CharacterInfoView()
    var viewModel: CharacterInfoViewModelProtocol
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    init(viewModel: CharacterInfoViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    @objc func buttonAction() {
//        let largeConfig = UIImage.SymbolConfiguration(scale: .large)
//        if mainView.favuriteButton.isSelected {
//            let icon = UIImage(systemName: "heart", withConfiguration: largeConfig)
//
//            mainView.favuriteButton.setImage(icon, for: .normal)
//            mainView.favuriteButton.tintColor = .systemRed
//            mainView.favuriteButton.isSelected = false
//        } else {
//            let icon = UIImage(systemName: "heart.fill", withConfiguration: largeConfig)
//
//            mainView.favuriteButton.setImage(icon, for: .normal)
//            mainView.favuriteButton.tintColor = .systemRed
//
//            mainView.favuriteButton.isSelected = true
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
//        mainView.favuriteButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
}

extension CharacterInfoViewController:  CharacterInfoViewModelDelegate {
    
    func didLoadCharacterModel() {
        
        guard let name = viewModel.characterModel?.name,
              let status = viewModel.characterModel?.status,
              let species = viewModel.characterModel?.species,
              let type = viewModel.characterModel?.type,
              let gender = viewModel.characterModel?.gender,
              let origin = viewModel.characterModel?.origin.name,
              let location = viewModel.characterModel?.location.name,
              let imageUrl = viewModel.characterModel?.image else {
            return
        }
        
        DispatchQueue.main.async {
            self.mainView.populate(characterName: name, status: status, species: species, type: type, gender: gender, origin: origin, location: location, imageUrl: imageUrl)
        }
        
    }
}
