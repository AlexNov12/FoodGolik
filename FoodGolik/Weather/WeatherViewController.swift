//
//  WeatherViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 22.04.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let currentGeopositionButton = UIButton()
    private let cityForFindingTextField = UITextField()
    private let findWeatherButton = UIButton()
    
    private let weatherImage = UIImageView()
    
    private let temperatureLabel = UILabel()
    private let degreesLabel = UILabel()
    private let celsiusLabel = UILabel()
    private let currentCityLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedViews()
        setupLayouts()
        setupAppearance()
        setupData()
    }
}

#Preview(traits: .portrait) {
    WeatherViewController()
}

// MARK: - Embed Views
extension WeatherViewController {
    func embedViews() {
        view.addSubview(currentGeopositionButton)
        view.addSubview(cityForFindingTextField)
        view.addSubview(findWeatherButton)
        view.addSubview(weatherImage)
        view.addSubview(temperatureLabel)
        view.addSubview(degreesLabel)
        view.addSubview(celsiusLabel)
        view.addSubview(currentCityLabel)
        
    }
}

// MARK: - Setup Layouts
extension WeatherViewController {
    func setupLayouts() {
        currentGeopositionButton.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(40)
            
        }
        
        cityForFindingTextField.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(currentGeopositionButton.snp.trailing).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(274)
            
        }
        
        findWeatherButton.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(cityForFindingTextField.snp.trailing).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(40)
            
        }
        
        weatherImage.snp.makeConstraints{ make in
            make.top.equalTo(findWeatherButton.snp.bottom).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(120)
            make.width.equalTo(120)
        }
        
        celsiusLabel.snp.makeConstraints{ make in
            make.top.equalTo(weatherImage.snp.bottom).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(120)
            make.width.equalTo(67)
        }
        
        degreesLabel.snp.makeConstraints{ make in
            make.top.equalTo(weatherImage.snp.bottom).offset(0)
            make.trailing.equalTo(celsiusLabel.snp.leading).offset(30)
            make.height.equalTo(120)
            make.width.equalTo(50)
        }
        
        temperatureLabel.snp.makeConstraints{ make in
            make.top.equalTo(weatherImage.snp.bottom).offset(20)
            make.trailing.equalTo(degreesLabel.snp.leading).offset(50)
            make.height.equalTo(120)
            make.width.equalTo(150)
        }
        
        currentCityLabel.snp.makeConstraints{ make in
            make.top.equalTo(celsiusLabel.snp.bottom).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(150)
            make.height.equalTo(20)
            make.width.equalTo(250)
        }
    }
}

// MARK: - Setup Layouts
extension WeatherViewController {
    func setupAppearance() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "light_background")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        currentGeopositionButton.setTitleColor(.white, for: .normal)
        currentGeopositionButton.setBackgroundImage(UIImage(systemName: "paperplane.circle.fill"), for: .normal)
        currentGeopositionButton.tintColor = UIColor.black
        currentGeopositionButton.layer.cornerRadius = 16
        //currentGeopositionButton.addTarget(self, action: #selector(succedLogin), for: .touchUpInside)
        
        cityForFindingTextField.textColor = .black
        cityForFindingTextField.font = .systemFont(ofSize: 25)
        cityForFindingTextField.borderStyle = .roundedRect
        cityForFindingTextField.textAlignment = .right
        cityForFindingTextField.backgroundColor = UIColor.systemFill
        
        findWeatherButton.setTitleColor(.white, for: .normal)
        findWeatherButton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        findWeatherButton.tintColor = UIColor.black
        findWeatherButton.layer.cornerRadius = 16
        //findWeatherButton.addTarget(self, action: #selector(succedLogin), for: .touchUpInside)
        
        weatherImage.image = UIImage(systemName: "cloud.hail")
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.tintColor = UIColor.black
        
        celsiusLabel.textColor = .label
        celsiusLabel.font = .systemFont(ofSize: 100, weight: .light)
        
        degreesLabel.textColor = .label
        degreesLabel.font = .systemFont(ofSize: 75, weight: .light)
        
        temperatureLabel.textColor = .label
        temperatureLabel.font = .systemFont(ofSize: 80, weight: .black)
        
        currentCityLabel.textColor = .label
        currentCityLabel.font = .systemFont(ofSize: 30, weight: .regular)
    }
}


// MARK: - Setup Data
extension WeatherViewController{
    func setupData() {
        cityForFindingTextField.placeholder = "Search"
        celsiusLabel.text = "C"
        degreesLabel.text = "°"
        temperatureLabel.text = "21"
        currentCityLabel.text = "Silifke"
    }
}
