//
//  WeatherData.swift
//  FoodGolik
//
//  Created by Александр Новиков on 24.04.2024.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
