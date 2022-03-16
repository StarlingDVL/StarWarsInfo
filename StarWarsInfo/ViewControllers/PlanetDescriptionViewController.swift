//
//  PlanetDescriptionViewController.swift
//  StarWarsInfo
//
//  Created by Юрий Скворцов on 08.03.2022.
//

import UIKit

class PlanetDescriptionViewController: UIViewController {
    
    var planet: Planet!
    
    @IBOutlet var planetImageView: UIImageView!
    
    @IBOutlet var planetDescriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        planetImageView.layer.cornerRadius = 30
        planetImageView.image = UIImage(named: "\(planet.name ?? "No planet")")
        
        navigationItem.title = planet.name
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemYellow]
        
        planetDescriptionLabel.text = planet.description
    }
}
