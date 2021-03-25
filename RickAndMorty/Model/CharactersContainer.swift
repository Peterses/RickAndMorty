//
//  CharactersContainer.swift
//  RickAndMorty
//
//  Created by Peterses on 19/03/2021.
//

import Foundation

struct CharactersContainer: Decodable {
    
//    enum CodingKeys: String, CodingKey {
//        case ingo = "info"
//        let results
//    }
    
    let info: Info
    let results: [CharacterModel]
}


struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}
