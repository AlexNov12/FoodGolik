//
//  Item.swift
//  FoodGolik
//
//  Created by Александр Новиков on 11.05.2024.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
}
