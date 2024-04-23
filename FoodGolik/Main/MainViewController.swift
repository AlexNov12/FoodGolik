//
//  MainViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 11.04.2024.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        tabBar.barTintColor = UIColor.systemBlue
        tabBar.tintColor = UIColor.green
        tabBar.isTranslucent = false
        
        
        let profileVC = ProfileViewController()
        profileVC.view.backgroundColor = .systemBackground
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image:UIImage(systemName: "person.crop.circle") , tag: 0)
        
        let photoVC = ImageViewController()
        photoVC.view.backgroundColor = .systemBackground
        photoVC.tabBarItem = UITabBarItem(title: "Картинки", image:UIImage(systemName: "photo") , tag: 1)
        
        let chatVC = UIViewController()
        chatVC.view.backgroundColor = .systemBackground
        chatVC.tabBarItem = UITabBarItem(title: "Чат", image:UIImage(systemName: "message"), tag: 2)
        
        let mapsVC = UIViewController()
        mapsVC.view.backgroundColor = .systemBackground
        mapsVC.tabBarItem = UITabBarItem(title: "Карты", image:UIImage(systemName: "map"), tag: 3)
        
        let toDoVC = WeatherViewController()
        toDoVC.view.backgroundColor = .systemBackground
        toDoVC.tabBarItem = UITabBarItem(title: "Погода", image: UIImage(systemName: "sun.min"), tag: 4)
        
        self.viewControllers = [profileVC, photoVC, chatVC, mapsVC, toDoVC]
    }
}


//#Preview(traits: .portrait) {
//    MainViewController()
//}
