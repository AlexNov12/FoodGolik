//
//  ImageViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 22.04.2024.
//

import UIKit
import SnapKit

class ImageViewController: UIViewController {
    
    private let alertView = UIView()
    private let alertLabel = UILabel()
    private let alertDescriptionLabel = UILabel()
    
    private let alertPrimaryButton = UIButton()
    private let alertSecondaryButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        setupData()
    }
    
    func embedViews() {
        view.addSubview(alertView)
        alertView.addSubview(alertLabel)
        alertView.addSubview(alertDescriptionLabel)
        alertView.addSubview(alertPrimaryButton)
        alertView.addSubview(alertSecondaryButton)
        
    }
    
    func setupLayout() {
        alertView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-125)
        }
        
        alertLabel.snp.makeConstraints{ make in
            make.top.equalTo(alertView.snp.top).offset(32)
            make.leading.equalTo(alertView.snp.leading).offset(51)
            make.trailing.equalTo(alertView.snp.trailing).offset(-49)
        }
        
        alertDescriptionLabel.snp.makeConstraints{ make in
            make.top.equalTo(alertLabel.snp_bottomMargin).offset(16)
            make.leading.equalTo(alertView.snp.leading).offset(16)
            make.trailing.equalTo(alertView.snp.trailing).offset(-16)
        }
        
        alertPrimaryButton.snp.makeConstraints{ make in
            make.top.equalTo(alertDescriptionLabel.snp.bottom).offset(45)
            make.leading.equalTo(alertView.snp.leading).offset(16)
            make.trailing.equalTo(alertView.snp.trailing).offset(-16)
            make.height.equalTo(51)
        }
        
        alertSecondaryButton.snp.makeConstraints{ make in
            make.top.equalTo(alertPrimaryButton.snp.bottom).offset(18)
            make.leading.equalTo(alertView.snp.leading).offset(16)
            make.trailing.equalTo(alertView.snp.trailing).offset(-16)
            make.bottom.equalTo(alertView.snp.bottom).offset(-16)
        }
    }
    
    func setupAppearance() {
        view.backgroundColor = .blue
        
        alertView.backgroundColor = .gray
        alertView.layer.cornerRadius = 16
        
        alertLabel.textColor = .label
        alertLabel.textAlignment = .center
        alertLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        
        alertDescriptionLabel.textAlignment = .center
        alertDescriptionLabel.numberOfLines = 0
        alertDescriptionLabel.textColor = .secondaryLabel
        alertDescriptionLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        alertPrimaryButton.setTitleColor(.white, for: .normal)
        alertPrimaryButton.backgroundColor = .blue
        alertPrimaryButton.layer.cornerRadius = 16
        
        alertSecondaryButton.setTitleColor(.blue, for: .normal)
        
    }
    
    func setupData() {
        alertLabel.text = "Contratulations!"
        
        alertDescriptionLabel.text = "Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit qui adipisicing sunt."
        
        alertPrimaryButton.setTitle("Click me", for: .normal)
        
        alertSecondaryButton.setTitle("Secondary action", for: .normal)
    }

}

