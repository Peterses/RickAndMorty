//
//  UITableView.swift
//  RickAndMorty
//
//  Created by Peterses on 19/03/2021.
//

import UIKit

extension UITableView {
    
    func registerCellClasses(_ cellClasses: [Identifiable.Type]) {
        cellClasses.forEach { register($0, forCellReuseIdentifier: $0.identifier) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: Identifiable {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue table view cell with identifier \(T.identifier)")
        }
        
        return cell
    }
}
