//
//  File.swift
//  StarWarsInfo
//
//  Created by Юрий Скворцов on 08.03.2022.
//

import Foundation

class NetworkPlanetManager {
    static let share = NetworkPlanetManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(PLanetList) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            
            do {
                let planets = try JSONDecoder().decode(PLanetList.self, from: data)
                DispatchQueue.main.async {
                    completion(planets)
                }
            } catch let error {
                print(error.localizedDescription)
            }

        }.resume()
    }
}
