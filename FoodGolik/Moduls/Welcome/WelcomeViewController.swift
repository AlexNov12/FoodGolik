//
//  ViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 09.04.2024.
//

import UIKit
import SnapKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class WelcomeViewController: UIViewController {
    
    private let mainViewLabel = UILabel()
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    private let mainViewRegisterButton = UIButton()
    private let mainViewLoginButton = UIButton()
    
    private let errorAlert = UIAlertController(
        title: "Ошибка",
        message: "Проверьте корректность введения логина и пароля",
        preferredStyle: .alert
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundImage()
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
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)

    }
    
}

// MARK: - Setup Layout

extension WelcomeViewController {
    func setupLayout() {
        mainViewLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(120)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
            
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(mainViewLabel.snp_bottomMargin).offset(50)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp_bottomMargin).offset(20)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        mainViewRegisterButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(50)
            make.leading.equalTo(view.snp_leadingMargin).offset(100)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-100)
        }
        
        mainViewLoginButton.snp.makeConstraints { make in
            make.top.equalTo(mainViewRegisterButton.snp_bottomMargin).offset(16)
            make.leading.equalTo(view.snp_leadingMargin).offset(100)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-100)
        }
    }
}

// MARK: - Setup Appearance

extension WelcomeViewController {
    func setupAppearance() {
        view.backgroundColor = .white
        
        mainViewLabel.textColor = .label
        mainViewLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        mainViewLabel.numberOfLines = 0
        mainViewLabel.textAlignment = .center
        
        mainViewLoginButton.setTitleColor(.white, for: .normal)
        mainViewLoginButton.backgroundColor = .darkGray
        mainViewLoginButton.layer.cornerRadius = 16
        mainViewLoginButton.addTarget(self, action: #selector(succedLogin), for: .touchUpInside)
        
        mainViewRegisterButton.setTitleColor(.white, for: .normal)
        mainViewRegisterButton.backgroundColor = .darkGray
        mainViewRegisterButton.layer.cornerRadius = 16
        mainViewRegisterButton.addTarget(self, action: #selector(succedRegistration), for: .touchUpInside)
        
        
        emailTextField.placeholder = "Электронная почта"
        emailTextField.textColor = .black
        emailTextField.font = .systemFont(ofSize: 18)
        emailTextField.borderStyle = .roundedRect
        emailTextField.textAlignment = .center
        
        passwordTextField.placeholder = "Пароль"
        passwordTextField.textColor = .black
        passwordTextField.font = .systemFont(ofSize: 18)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.textAlignment = .center
        passwordTextField.isSecureTextEntry = true
        
        errorAlert.addAction(UIAlertAction(title: "Ок", style: .cancel))
    }
    
    @objc func goToLoginView() {
        let secondVC = LoginViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

// MARK: - Setup Data

extension WelcomeViewController {
    func setupData() {
        mainViewLabel.text = "Добро пожаловать в Food Golik"
        mainViewLoginButton.setTitle("Войти", for: .normal)
        mainViewRegisterButton.setTitle("Регистрация", for: .normal)
    }
}

// MARK: - Setup Background

extension WelcomeViewController {
    func addBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "MainVCBackground")
        backgroundImage.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
    }
}

// MARK: - Click Handler

extension WelcomeViewController {
    @objc func succedRegistration() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorAlert.message = errorHandlerForRegLogVC(e.localizedDescription)
                    self.showRegistrationAlert()
                    print(e.localizedDescription)
                } else {
                    let nextVC = MainViewController()
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
        }
    }
    @objc func showRegistrationAlert() {
        present(errorAlert, animated: true)
    }
    
    @objc func succedLogin() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    //self.showLoginAlert.message = errorHandlerForRegLogVC(e.localizedDescription)
                    self.showLoginAlert()
                    print(e.localizedDescription)
                } else {
                    let nextVC = MainViewController()
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
        }
    }
    
    @objc func showLoginAlert() {
        present(errorAlert, animated: true)
    }
}


//#Preview(traits: .portrait) {
//    WelcomeViewController()
//}

