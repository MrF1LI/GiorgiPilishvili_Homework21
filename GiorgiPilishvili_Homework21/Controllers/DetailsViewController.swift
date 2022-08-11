//
//  DetailsViewController.swift
//  GiorgiPilishvili_Homework21
//
//  Created by GIORGI PILISSHVILI on 10.08.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: Variables
    
    @IBOutlet weak var imageViewFlag: UIImageView!
    @IBOutlet weak var labelCapital: UILabel!
    @IBOutlet weak var labelRegion: UILabel!
    @IBOutlet weak var labelSubregion: UILabel!

    var country: Country!
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadCountryDetails()
    }
    
    // MARK: Functions
    
    func loadCountryDetails() {
        title = country.name
        imageViewFlag.load(url: URL(string: country.flags.png)!)
        imageViewFlag.layer.cornerRadius = 35
        
        labelRegion.text = country.region
        labelRegion.text = country.subregion
        labelCapital.text = country.capital
    }

}
