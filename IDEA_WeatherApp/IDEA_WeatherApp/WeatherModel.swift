//
//  WeatherModel.swift
//  IDEA_WeatherApp
//
//  Created by Omar Adel on 6/12/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let location: Location?
    let current: Current?
}

struct Current: Codable {
    let temp_c: Double?
    let condition: Condition?
}

struct Condition: Codable {
    let text, icon: String?
}

struct Location: Codable {
    let name, region, country: String?
    let localtime: String?
}
