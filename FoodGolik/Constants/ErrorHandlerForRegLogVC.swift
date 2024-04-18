//
//  ErrorHandlerForRegLogVC.swift
//  FoodGolik
//
//  Created by Александр Новиков on 17.04.2024.
//

import Foundation

func errorHandlerForRegLogVC(_ error: String) -> String{
    switch error {
    case "The password must be 6 characters long or more." :
        return "Пароль должен быть не меньше 6 символов"
    default:
        return "Неверный формат электронной почты"
    }
}
