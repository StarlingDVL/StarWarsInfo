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
    
    var description: String {
        """
        Name: \(name ?? "Unknown")
        Rotation period: \(rotationPeriod ?? "Unknown")
        Orbital period: \(orbitalPeriod ?? "Unknown")
        Diametr: \(diameter ?? "Unknown")
        Climate: \(climate ?? "Unknown")
        Population: \(population ?? "Unknown")
        """
    }
    init (planetData: [String: Any]) {
        name = planetData["name"] as? String
        rotationPeriod = planetData["rotation_period"] as? String
        orbitalPeriod = planetData["orbital_period"] as? String
        diameter = planetData["diameter"] as? String
        climate = planetData["climate"] as? String
        population = planetData["population"] as? String
    }
    
    static func getPlanets(from value: Any) -> [Planet] {
        guard let planetList = value as? [String: Any] else { return [] }
        guard let planetsData = planetList["results"] as? [[String: Any]] else { return [] }
        var planets: [Planet] = []
        
        for planetData in planetsData {
            let planet = Planet(planetData: planetData)
            planets.append(planet)
        }
        return planets
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case population
    }
}

struct PLanetList: Decodable {
    let results: [Planet]
}
