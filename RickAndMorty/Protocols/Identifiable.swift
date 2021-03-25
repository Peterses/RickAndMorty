//
//  Identifiable.swift
//  RickAndMorty
//
//  Created by Peterses on 19/03/2021.
//

import Foundation

protocol Identifiable: class {
    
    static var identifier: String { get }
}

extension Identifiable {
    
    static var identifier: String {
        return String(describing: self)
    }
}
