//
//  Planet.swift
//  StarWarsInfo
//
//  Created by Юрий Скворцов on 08.03.2022.
//

import Foundation

struct Planet: Decodable {
    let name: String?
    let rotationPeriod: String?
    let orbitalPeriod: String?
    let diameter: String?
    let climate: String?
    let population: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case population
    }
}

struct PlanetList: Decodable {
    let results: [Planet]
}
