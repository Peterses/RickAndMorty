//
//  TabBarViewController.swift
//  RickAndMorty
//
//  Created by Peterses on 16/03/2021.
//

import UIKit

class TabBarViewController: UITabBarController, Coordinating {
    var coordinator: Coordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        let charactersViewController = CharactersViewController()
//        let favouritesViewController = FavouritesViewController()
//        let searchViewController = SearchViewController()
//
//        charactersViewController.title = "Characters"
//        favouritesViewController.title = "Favourites"
//        searchViewController.title =  "Search"
//
//        let nav1 = UINavigationController(rootViewController: charactersViewController)
//        let nav2 = UINavigationController(rootViewController: favouritesViewController)
//        let nav3 = UINavigationController(rootViewController: searchViewController)
//
//        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.3"), tag: 1)
//        nav2.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "heart"), tag: 1)
//        nav3.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
//
//        nav1.navigationBar.prefersLargeTitles = true
//        nav2.navigationBar.prefersLargeTitles = true
//        nav3.navigationBar.prefersLargeTitles = true
//
//
//        setViewControllers([nav1, nav2, nav3], animated: false)
    }

}
