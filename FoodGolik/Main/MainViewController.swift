//
//  MainViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 11.04.2024.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    let profileVC = ProfileViewController()
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
        
        initialize()
        
        let toDoVC = ToDoViewController()
        toDoVC.view.backgroundColor = .systemBackground
        toDoVC.tabBarItem = UITabBarItem(title: "Дела", image: UIImage(systemName: "square.stack"), tag: 0)
        
        let photoVC = ImageViewController()
        photoVC.view.backgroundColor = .systemBackground
        photoVC.tabBarItem = UITabBarItem(title: "Картинки", image:UIImage(systemName: "photo") , tag: 1)
        
        let chatVC = ChatViewController()
        chatVC.view.backgroundColor = .systemBackground
        chatVC.tabBarItem = UITabBarItem(title: "Чат", image:UIImage(systemName: "message"), tag: 2)
        
        let mapsVC = MapViewController()
        mapsVC.view.backgroundColor = .systemBackground
        mapsVC.tabBarItem = UITabBarItem(title: "Карты", image:UIImage(systemName: "map"), tag: 3)
        
        let weatherVC = WeatherViewController()
        weatherVC.view.backgroundColor = .systemBackground
        weatherVC.tabBarItem = UITabBarItem(title: "Погода", image: UIImage(systemName: "sun.min"), tag: 4)
        
        self.viewControllers = [toDoVC, photoVC, chatVC, mapsVC, weatherVC]
    }
}
// MARK: - UpButtons

extension TabBarController {
    
    func initialize() {
        navigationItem.leftBarButtonItems = initializeLeftButtonItems()
        navigationItem.rightBarButtonItems = initializeRightButtonItems()
    }
    
    func initializeLeftButtonItems() -> [UIBarButtonItem]{
        let addProfileBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(didTapProfileItem))
        addProfileBarButtonItem.tintColor = .black
        return [addProfileBarButtonItem]
    }
    
    func initializeRightButtonItems() -> [UIBarButtonItem]{
        let addSettingsBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(didTapSettingsItem))
        addSettingsBarButtonItem.tintColor = .black
        return [addSettingsBarButtonItem]
    }
    
    @objc func didTapSettingsItem() {
        print("Settings button taped")
    }
    
    @objc func didTapProfileItem() {
        navigationController?.pushViewController(profileVC, animated: true)
    }
}

//#Preview(traits: .portrait) {
//    MainViewController()
//}
