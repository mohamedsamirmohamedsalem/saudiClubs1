//
//  Home.swift
//  FoodDelivery
//
//  Created by Mohamed Samir on 10/28/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import Foundation

// MARK: - Home
struct Home: Codable {
    let title: String?
    var types: [CircleModel]?
}

// MARK: - TypeElement
struct CircleModel: Codable {
    let id: Int?
    let image: String?
    let title: String?
    var isSelected: Bool? = false
}
