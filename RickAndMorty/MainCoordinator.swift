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
        var vc: UIViewController & Coordinating = CharacterInfoController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
        navigationController?.navigationBar.isTranslucent = true
    }
    
}
