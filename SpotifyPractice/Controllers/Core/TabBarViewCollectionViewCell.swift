//
//  TabBarViewCollectionViewCell.swift
//  SpotifyPractice
//
//  Created by Apple New on 2022-04-26.
//

import UIKit

class TabBarViewController: UITabBarController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let libraryVC = LibraryViewController()
        
        homeVC.title = "home"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        
        let navVC1 = UINavigationController(rootViewController: homeVC)
        let navVC2 = UINavigationController(rootViewController: searchVC)
        let navVC3 = UINavigationController(rootViewController: libraryVC)
        
        navVC1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navVC2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        navVC3.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 1)
        
        navVC1.navigationBar.prefersLargeTitles = true
        navVC2.navigationBar.prefersLargeTitles = true
        navVC3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navVC1, navVC2, navVC3], animated: false)
    }
}
