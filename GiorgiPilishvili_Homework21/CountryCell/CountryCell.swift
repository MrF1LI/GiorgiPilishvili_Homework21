//
//  CountryCell.swift
//  GiorgiPilishvili_Homework21
//
//  Created by GIORGI PILISSHVILI on 11.08.22.
//

import UIKit

class CountryCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewFlag: UIImageView!
    
    // MARK: Lifecycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureDesign()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: Functions
    
    func configureDesign() {
        imageViewFlag.layer.cornerRadius = imageViewFlag.frame.width / 2
    }
    
    func configure(with country: Country) {
        labelName.text = country.name
        
        if let url = URL(string: country.flags.png) {
            imageViewFlag.load(url: url)
        }
    }
    
}
