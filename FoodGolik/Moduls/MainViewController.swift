//
//  MainViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 11.04.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let ingredientsTextView = UITextView()
    private let checkButton = UIButton()
    

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
        view.addSubview(titleLabel)
        view.addSubview(ingredientsTextView)
        view.addSubview(checkButton)
    }
}

// MARK: - Setup Layout

extension MainViewController {
    func setupLayout() {
        view.backgroundColor = .systemGray5
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(50)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        ingredientsTextView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(30)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
            make.height.equalTo(500)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(ingredientsTextView.snp_bottomMargin).offset(50)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
            make.height.equalTo(50)
        }
        
    }
}

// MARK: - Setup Appearance

extension MainViewController {
    func setupAppearance() {
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.textColor = .black
        
        ingredientsTextView.text = "Введите список ингридиентов, разделенных запятой"
        ingredientsTextView.textColor = .systemGray
        ingredientsTextView.font = .systemFont(ofSize: 18)
        
        checkButton.setTitleColor(.black, for: .normal)
        checkButton.backgroundColor = .white
        checkButton.layer.cornerRadius = 16
        checkButton.setTitle("Поиск", for: .normal)
    }
}


// MARK: - Setup Data

extension MainViewController {
    func setupData() {
        titleLabel.text = "Анализ состава продукта"
//        mainViewLoginButton.setTitle("Log In", for: .normal)
//        mainViewRegisterButton.setTitle("Register", for: .normal)
    }
}

//#Preview(traits: .portrait) {
//    MainViewController()
//}
