//
//  RegisterViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 10.04.2024.
//

import UIKit
import SnapKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    private let emailTextView = UITextField()
    private let passwordTextView = UITextField()
    private let registerButton = UIButton()
    private let errorRegistrationAlert = UIAlertController(
        title: "Ошибка",
        message: "Проверьте корректность введения логина и пароля",
        preferredStyle: .alert
    )

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
        passwordTextView.isSecureTextEntry = true
        
        
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = .white
        registerButton.layer.cornerRadius = 16
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(succedRegistration), for: .touchUpInside)
        
        errorRegistrationAlert.addAction(UIAlertAction(title: "Ок", style: .cancel))
    }
    
    @objc func succedRegistration() {
        if let email = emailTextView.text, let password = passwordTextView.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.registerButton.addTarget(self, action: #selector(self.showAlert), for: .touchUpInside)
                    print(e.localizedDescription)
                } else {
                    let nextVC = MainViewController()
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
        }
    }
    
    @objc func showAlert() {
        present(errorRegistrationAlert, animated: true)
    }
}



//#Preview(traits: .portrait) {
//    RegisterViewController()
//}


