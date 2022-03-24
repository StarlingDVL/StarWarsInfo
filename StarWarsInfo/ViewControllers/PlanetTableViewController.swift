//
//  PlanetTableViewController.swift
//  StarWarsInfo
//
//  Created by Юрий Скворцов on 08.03.2022.
//

import UIKit
import Alamofire

class PlanetTableViewController: UITableViewController {
    
    var planetList: PLanetList?
    var planets: [Planet]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPlanetWithAlamofire("https://swapi.dev/api/planets/?format=json")
        //fetchPlanet(from: "https://swapi.dev/api/planets/?format=json")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let descriptionVC = segue.destination as? PlanetDescriptionViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        //descriptionVC.planet = planetList?.results[indexPath.row]
        descriptionVC.planet = planets?[indexPath.row]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //planetList?.results.count ?? 0
        planets?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        //content.text = planetList?.results[indexPath.row].name
        content.text = planets?[indexPath.row].name
        
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func fetchPlanet(from url: String) {
        NetworkPlanetManager.share.fetchData(from: url) { planetList in
            self.planetList = planetList
            self.tableView.reloadData()
        }
    }
    
    private func fetchPlanetWithAlamofire(_ url: String) {
        NetworkPlanetManager.share.fetchPlanetsWithAlamofire(url) { result in
            switch result {
            case .success(let planets):
                self.planets = planets
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
