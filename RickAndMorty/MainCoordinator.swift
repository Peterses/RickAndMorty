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
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        navigationController?.setViewControllers([vc], animated: false)
//        navigationController?.navigationBar.isTranslucent = true
    }
    
}
