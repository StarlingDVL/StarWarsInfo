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
        navigationItem.title = planet.name
        planetDescriptionLabel.text = planet.description
    }
}
