//
//  CorrectProfileViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 01.05.2024.
//

import UIKit

class CorrectProfileViewController: UIViewController {
    
    var nameProfileForCorrect = ""
    var emailProfileForCorrect = ""
    var descriptionProfileForCorrect = ""
    
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let nameView = UIView()
    private let emailLabel = UILabel()
    private let emailTextField = UITextField()
    private let emailView = UIView()
    private let descriptionLabel = UILabel()
    private let descriptionTextField = UITextView()
    private let descriptionView = UIView()
    private let saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedView()
        setupLayout()
        setupAppearance()
        setupData()
        
    }
}

// MARK: - Embed View
extension CorrectProfileViewController {
    func embedView() {
        let arrayOfElmenets = [nameLabel, nameView, emailLabel, descriptionLabel, emailView, descriptionView, saveButton]
        arrayOfElmenets.forEach {view.addSubview($0)}
        nameView.addSubview(nameTextField)
        emailView.addSubview(emailTextField)
        descriptionView.addSubview(descriptionTextField)
        
    }
}

// MARK: - Setup Layouts
extension CorrectProfileViewController {
    func setupLayout() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.height.equalTo(20)
        }
        
        nameView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(nameView).inset(10)
            
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.height.equalTo(20)
        }
        
        emailView.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(emailView).inset(10)
            
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(emailView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.height.equalTo(20)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
        
        descriptionTextField.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(descriptionView).inset(10)
            
        }
        
        saveButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-10)
            make.top.equalTo(view.snp.top).offset(50)
        }
        
        
    }
}

// MARK: - SetupAppearance
extension CorrectProfileViewController {
    func setupAppearance() {
        
        view.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        nameView.backgroundColor = .systemBackground
        nameView.layer.cornerRadius = 10
        
        nameTextField.textAlignment = .left
        nameTextField.font = .systemFont(ofSize: 18, weight: .semibold)
        nameTextField.isEnabled = true
        nameTextField.tintColor = .black
        
        emailLabel.textAlignment = .center
        emailLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        emailView.backgroundColor = .systemBackground
        emailView.layer.cornerRadius = 10
        
        emailTextField.textAlignment = .left
        emailTextField.font = .systemFont(ofSize: 18, weight: .semibold)
        emailTextField.isEnabled = true
        emailTextField.tintColor = .black
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        descriptionView.backgroundColor = .systemBackground
        descriptionView.layer.cornerRadius = 10
        
        descriptionTextField.textAlignment = .left
        descriptionTextField.font = .systemFont(ofSize: 18, weight: .semibold)
        descriptionTextField.isEditable = true
        descriptionTextField.tintColor = .black
        
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .darkGray
        saveButton.layer.cornerRadius = 16
        saveButton.addTarget(self, action: #selector(succedRegistration), for: .touchUpInside)
    }
    
    @objc func succedRegistration() {
        UserDefaults.standard.set(nameTextField.text, forKey: "Name")
        UserDefaults.standard.set(emailTextField.text, forKey: "Email")
        UserDefaults.standard.set(descriptionTextField.text, forKey: "Description")
    }
}

// MARK: - SetupData
extension CorrectProfileViewController {
    func setupData() {
        nameLabel.text = "Имя"
        nameTextField.placeholder = "Введите новое имя"
        emailLabel.text = "Адрес эл. почты"
        emailTextField.placeholder = "Введите новый адрес эл. почты"
        descriptionLabel.text = "Описание"
        descriptionTextField.text = "Введите новое описание"
    }
}

//#Preview(traits: .portrait) {
//    CorrectProfileViewController()
//}
