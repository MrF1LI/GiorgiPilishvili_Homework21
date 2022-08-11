//
//  ConfigCountries.swift
//  GiorgiPilishvili_Homework21
//
//  Created by GIORGI PILISSHVILI on 11.08.22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCountries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell
        guard let cell = cell else { return UITableViewCell() }
        
        let currentCountry = filteredCountries[indexPath.row]
        cell.configure(with: currentCountry)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let currentCountry = filteredCountries[indexPath.row]
        showDetails(of: currentCountry)
    }
    
    func showDetails(of country: Country) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        guard let detailsVC = detailsVC else { return }
        
        detailsVC.country = country
        navigationController?.pushViewController(detailsVC, animated: true)
    }

}
