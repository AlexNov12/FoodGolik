//
//  ProfileViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 22.04.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let topBackgroundView = UIView()
    private let photoImage = UIImageView()
    fileprivate let nameLabel = UITextField()
    fileprivate let mailLabel = UITextField()
    private let descritpionView = UITextField()
    private let descriptionLabel = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        setupData()
        setupRightBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupData()
    }

}

// MARK: - Embed View
extension ProfileViewController {
    func embedViews() {
        
        let arrayOfViews = [topBackgroundView, photoImage, nameLabel, mailLabel, descritpionView]
        arrayOfViews.forEach { view.addSubview($0) }
        
        view.addSubview(descriptionLabel)
    }
}

// MARK: - Setup Layouts
extension ProfileViewController {
    func setupLayout() {
        topBackgroundView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(245)
        }
        
        photoImage.snp.makeConstraints{ make in
            make.size.equalTo(200)
            make.top.equalTo(view.snp.top).offset(145)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(photoImage.snp.bottom).offset(20)
            make.height.equalTo(36)
            make.centerX.equalToSuperview()
        }
        
        mailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.height.equalTo(19)
            make.centerX.equalToSuperview()
        }
        
        descritpionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(mailLabel.snp.bottom).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(descritpionView).inset(10)
        }
    }
}

// MARK: - Setup Appearance
extension ProfileViewController {
    func setupAppearance() {
        topBackgroundView.backgroundColor = UIColor(red: 101/255, green: 166/255, blue: 170/255, alpha: 1)
        view.backgroundColor = .systemBackground
        
        photoImage.image = .aleksandr
        photoImage.layer.borderWidth = 4
        photoImage.layer.masksToBounds = false
        photoImage.layer.borderColor = UIColor.white.cgColor
        photoImage.layer.cornerRadius = 100
        photoImage.clipsToBounds = true
        
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        nameLabel.isEnabled = false
        
        mailLabel.textAlignment = .center
        mailLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        mailLabel.isEnabled = false
        
        descritpionView.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        descritpionView.layer.cornerRadius = 10
        
        descriptionLabel.textAlignment = .justified
        //descriptionLabel.numberOfLines = 0
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Профиль"
        navigationItem.titleView?.sizeToFit()
        

    }
}

// MARK: - Setup Data
extension ProfileViewController {
    func setupData() {
        if let name = UserDefaults.standard.string(forKey: "Name") {
            nameLabel.text = name
        }
        
        if let email = UserDefaults.standard.string(forKey: "Email") {
            mailLabel.text = email
        }
        
        if let description = UserDefaults.standard.string(forKey: "Email") {
            descriptionLabel.text = description
        }
    }
}

// MARK: - Top Right Bar Button

extension ProfileViewController {
    func setupRightBarButton() {
        navigationItem.rightBarButtonItem = initializeRightButtonItems()
        
        func initializeRightButtonItems() -> UIBarButtonItem{
            let addCorrectBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(didTapSettingsItem))
            addCorrectBarButtonItem.tintColor = .black
            return addCorrectBarButtonItem
        }
        
    }
    @objc func didTapSettingsItem() {
        let correctProfileVC = CorrectProfileViewController()
        present(correctProfileVC, animated: true)
    }
}

//#Preview(traits: .portrait) {
//    ProfileViewController()
//}
