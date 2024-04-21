//
//  MainViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 11.04.2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let weatherView = UIView()
    private let anotherView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedView()
        setupLayout()
        setupAppearance()
        setupData()
    }

}

// MARK: - Embed View

extension MainViewController {
    func embedView() {
        view.addSubview(weatherView)
        view.addSubview(anotherView)

    }
}

// MARK: - Setup Layout

extension MainViewController {
    func setupLayout() {
        view.backgroundColor = .systemGray5
        
        weatherView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(50)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
            make.height.equalTo(150)
            make.width.equalTo(150)
            
        }
        
        anotherView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(50)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.height.equalTo(150)
            make.width.equalTo(150)
            
        }
        
    }
}

// MARK: - Setup Appearance

extension MainViewController {
    func setupAppearance() {
        weatherView.backgroundColor = .systemMint
        weatherView.layer.cornerRadius = 10
        
        anotherView.backgroundColor = .systemGray
        anotherView.layer.cornerRadius = 10

    }
}


// MARK: - Setup Data

extension MainViewController {
    func setupData() {

    }
}

#Preview(traits: .portrait) {
    MainViewController()
}
