//
//  TableView+deselect.swift
//  RickAndMorty
//
//  Created by Peterses on 24/03/2021.
//

import UIKit

extension UITableView {

    func deselectSelectedRow(animated: Bool) {
        if let indexPathForSelectedRow = self.indexPathForSelectedRow {
            self.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }

}
