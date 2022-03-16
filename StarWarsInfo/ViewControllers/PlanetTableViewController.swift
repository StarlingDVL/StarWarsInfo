//
//  PlanetTableViewController.swift
//  StarWarsInfo
//
//  Created by Юрий Скворцов on 08.03.2022.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    var planetList: PLanetList?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlanet(from: "https://swapi.dev/api/planets/?format=json")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let descriptionVC = segue.destination as? PlanetDescriptionViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        descriptionVC.planet = planetList?.results[indexPath.row]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planetList?.results.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = planetList?.results[indexPath.row].name
        
        cell.contentConfiguration = content

        return cell
    }
    
    private func fetchPlanet(from url: String) {
        NetworkPlanetManager.share.fetchData(from: url) { planetList in
            self.planetList = planetList
            self.tableView.reloadData()
        }
    }
    
}
