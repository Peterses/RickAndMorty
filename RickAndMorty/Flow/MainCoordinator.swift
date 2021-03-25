//
//  MainCoordinator.swift
//  RickAndMorty
//
//  Created by Peterses on 16/03/2021.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var children: [Coordinator]? = nil
    
    func eventOccured(with type: Event) {
        switch type {
        case .buttonTapped:
            print("Button Clicked")
        }
    }
    
    func start() {
        let viewModel = CharacterListViewModel()
        let vc = CharactersListViewController(viewModel: viewModel)
        vc.coordinator = self
        vc.title = "Characters List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func startCharacterInfo(model: CharacterModel) {
        let viewModel = CharacterInfoViewModel(id: model.id)
        viewModel.characterModel = model
        let vc = CharacterInfoViewController(viewModel: viewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
