//
//  Collection.swift
//  RickAndMorty
//
//  Created by Peterses on 19/03/2021.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
