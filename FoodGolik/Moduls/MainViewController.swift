//
//  MainViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 11.04.2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedView()
        setupLayout()
        setupAppearance()
        setupData()
        self.navigationItem.hidesBackButton = true
    }

}

// MARK: - Embed View

extension MainViewController {
    func embedView() {
        navigationItem.rightBarButtonItem = makeRightBarButtonItems()

    }
}

// MARK: - Setup Layout

extension MainViewController {
    func setupLayout() {
        view.backgroundColor = .systemGray5
        navigationController?.navigationBar.tintColor = .black
    }
}

// MARK: - Setup Appearance

extension MainViewController {
    func setupAppearance() {

    }
}


// MARK: - Setup Data

extension MainViewController {
    func setupData() {

    }
}


// MARK: - Right Bar Buttons

extension MainViewController {
    func makeRightBarButtonItems() -> UIBarButtonItem{
        let settingsBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(didTapSettingItem))
        return settingsBarButtonItem
    }
    
    @objc func didTapSettingItem() {
        print("First")
    }
}


//#Preview(traits: .portrait) {
//    MainViewController()
//}
