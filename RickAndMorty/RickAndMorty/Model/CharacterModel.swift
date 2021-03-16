//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Peterses on 16/03/2021.
//

import Foundation

struct CharacterModel: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Origin
struct Origin: Decodable {
    let name: String
    let url: String
}

// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}
