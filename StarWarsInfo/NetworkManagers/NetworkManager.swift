//
//  File.swift
//  StarWarsInfo
//
//  Created by Юрий Скворцов on 08.03.2022.
//

import Foundation

struct NetworkPlanetManager {
    
    mutating func fetchPlanet() {
        guard let url = URL(string: "https://swapi.dev/api/planets") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
               let planets = try JSONDecoder().decode(PlanetList.self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
