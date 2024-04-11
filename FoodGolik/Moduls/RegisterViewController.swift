//
//  RegisterViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 10.04.2024.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    private let emailTextView = UITextField()
    private let passwordTextView = UITextField()
    private let registerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        embedView()
        setupLayout()
        setupAppearance()
    }

}

// MARK: - Embed View

extension RegisterViewController {
    func embedView() {
        view.addSubview(emailTextView)
        view.addSubview(passwordTextView)
        view.addSubview(registerButton)
    }
    
}

// MARK: - Setup Layout

extension RegisterViewController {
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
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextView.snp_topMargin).offset(50)
            make.leading.equalTo(view.snp_leadingMargin).offset(100)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-100)
        }
    }
}

// MARK: - Setup Appearance

extension RegisterViewController {
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
        
        
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = .white
        registerButton.layer.cornerRadius = 16
        registerButton.setTitle("Register", for: .normal)
        
    }
}



#Preview(traits: .portrait) {
    RegisterViewController()
}


