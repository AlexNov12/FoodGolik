//
//  ViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 09.04.2024.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private let mainViewLabel = UILabel()
    
    private let mainViewRegisterButton = UIButton()
    private let mainViewLoginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        embedView()
        setupLayout()
        setupAppearance()
        setupData()
    }

}

// MARK: - Embed View

extension WelcomeViewController {
    func embedView() {
        view.addSubview(mainViewLabel)
        view.addSubview(mainViewRegisterButton)
        view.addSubview(mainViewLoginButton)
    }
    
}

// MARK: - Setup Layout

extension WelcomeViewController {
    func setupLayout() {
        mainViewLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.left.greaterThanOrEqualToSuperview()
        }
        
        mainViewLoginButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp_bottomMargin).offset(-16)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        mainViewRegisterButton.snp.makeConstraints { make in
            make.bottom.equalTo(mainViewLoginButton.snp_topMargin).offset(-16)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
    }
}

// MARK: - Setup Appearance

extension WelcomeViewController {
    func setupAppearance() {
        view.backgroundColor = .systemMint
        
        mainViewLabel.textColor = .label
        mainViewLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        
        mainViewLoginButton.setTitleColor(.white, for: .normal)
        mainViewLoginButton.backgroundColor = .darkGray
        mainViewLoginButton.layer.cornerRadius = 16
        mainViewLoginButton.addTarget(self, action: #selector(goToLoginView), for: .touchUpInside)
        
        mainViewRegisterButton.setTitleColor(.white, for: .normal)
        mainViewRegisterButton.backgroundColor = .darkGray
        mainViewRegisterButton.layer.cornerRadius = 16
        mainViewRegisterButton.addTarget(self, action: #selector(goToRegisterView), for: .touchUpInside)
        
    }
    
    @objc func goToRegisterView() {
        let secondVC = RegisterViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func goToLoginView() {
        let secondVC = LoginViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

// MARK: - Setup Data

extension WelcomeViewController {
    func setupData() {
        mainViewLabel.text = "Food Golik"
        mainViewLoginButton.setTitle("Log In", for: .normal)
        mainViewRegisterButton.setTitle("Register", for: .normal)
    }
}

//#Preview(traits: .portrait) {
//    MainViewController()
//}

