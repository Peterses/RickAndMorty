//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Peterses on 19/03/2021.
//

import Foundation

protocol CharacterListViewModelDelegate: AnyObject {
    func didLoadCharacterModel()
}

protocol CharacterListViewModelProtocol {
    var delegate: CharacterListViewModelDelegate? { get set }
    
    var characterModel: [CharacterModel]? { get set }
    
    func fetchData()
    func fetchMoreData(completion: @escaping (Bool?) -> Void)
}

class CharacterListViewModel: CharacterListViewModelProtocol {
    
    var delegate: CharacterListViewModelDelegate?
    
    private let dataFetcher = DataFetcher()
    
    private var currentPage: Int = 1
    private var lastPage: Int?
    
    var characterModel: [CharacterModel]?
    
    func fetchMoreData(completion: @escaping (Bool?) -> Void) {
        currentPage += 1
        dataFetcher.fetchCharacterModels(page: currentPage) { [weak self] (container, error) in
            guard let self = self else { return }
            if self.currentPage > self.lastPage ?? 0 {
                print("No more pages!")
                return
            }
            
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            
            if let characterModels = container?.results {
                self.characterModel?.append(contentsOf: characterModels)
                self.delegate?.didLoadCharacterModel()
                completion(true)
            }
        }
        
    }
    func fetchData() {
        dataFetcher.fetchCharacterModels(page: currentPage) { [weak self] (container, error) in
            guard let self = self else { return }
            
            if let characterModels = container?.results {
                
                if let lastPage = container?.info.pages {
                    self.lastPage = lastPage
                }
                
                self.characterModel = characterModels
                self.delegate?.didLoadCharacterModel()
            }
        }
    }
}
