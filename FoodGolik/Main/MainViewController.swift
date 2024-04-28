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
        
        // Создаем внешний вид для таб бара
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        
        // Применяем созданный внешний вид к текущему таб бару
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        
        
        
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
        
        let weatherVC = WeatherViewController()
        weatherVC.view.backgroundColor = .systemBackground
        weatherVC.tabBarItem = UITabBarItem(title: "Погода", image: UIImage(systemName: "sun.min"), tag: 4)
        
//        let toDoVC = WeatherViewController()
//        toDoVC.view.backgroundColor = .systemBackground
//        toDoVC.tabBarItem = UITabBarItem(title: "Дела", image: UIImage(systemName: "square.stack"), tag: 5)
        
        self.viewControllers = [profileVC, photoVC, chatVC, mapsVC, weatherVC]
    }
}


//#Preview(traits: .portrait) {
//    MainViewController()
//}
