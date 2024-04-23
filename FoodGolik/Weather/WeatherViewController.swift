//
//  WeatherViewController.swift
//  FoodGolik
//
//  Created by Александр Новиков on 22.04.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("WeatherViewController loaded")
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "light_background")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        // Do any additional setup after loading the view.
    }
}
