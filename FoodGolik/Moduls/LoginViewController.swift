//
//  LoginViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 10.04.2024.
//

import UIKit


class LoginViewController: UIViewController {
    
    private let emailTextView = UITextField()
    private let passwordTextView = UITextField()
    private let loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        embedView()
        setupLayout()
        setupAppearance()
    }

}

// MARK: - Embed View

extension LoginViewController {
    func embedView() {
        view.addSubview(emailTextView)
        view.addSubview(passwordTextView)
        view.addSubview(loginButton)
    }
    
}

// MARK: - Setup Layout

extension LoginViewController {
    func setupLayout() {
        emailTextView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(50)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        passwordTextView.snp.makeConstraints { make in
            make.top.equalTo(emailTextView.snp_topMargin).offset(50)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextView.snp_topMargin).offset(50)
            make.leading.equalTo(view.snp_leadingMargin).offset(100)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-100)
        }
    }
}

// MARK: - Setup Appearance

extension LoginViewController {
    func setupAppearance() {
        view.backgroundColor = .systemTeal
        
        emailTextView.placeholder = "Email"
        emailTextView.textColor = .black
        emailTextView.font = .systemFont(ofSize: 18)
        emailTextView.borderStyle = .roundedRect
        emailTextView.textAlignment = .center
        
        passwordTextView.placeholder = "Password"
        passwordTextView.textColor = .black
        passwordTextView.font = .systemFont(ofSize: 18)
        passwordTextView.borderStyle = .roundedRect
        passwordTextView.textAlignment = .center
        
        
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 16
        loginButton.setTitle("Register", for: .normal)
        
    }
}
