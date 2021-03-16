//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Peterses on 16/03/2021.
//

import UIKit

class CharacterInfoController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    

    var mainView = CharacterInfoView()
    
    private func initView() {
        view = mainView
    }
    
    @objc func buttonAction() {
        let largeConfig = UIImage.SymbolConfiguration(scale: .large)
        if mainView.favuriteButton.isSelected {
            let icon = UIImage(systemName: "heart", withConfiguration: largeConfig)
            UIView.animate(withDuration: 1) {
                self.mainView.favuriteButton.setImage(icon, for: .normal)
                self.mainView.favuriteButton.tintColor = .red
            }
            self.mainView.favuriteButton.isSelected = false
        } else {
            let icon = UIImage(systemName: "heart.fill", withConfiguration: largeConfig)
            UIView.animate(withDuration: 1) {
                self.mainView.favuriteButton.setImage(icon, for: .normal)
                self.mainView.favuriteButton.tintColor = .red
            }
            mainView.favuriteButton.isSelected = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        mainView.favuriteButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
}

