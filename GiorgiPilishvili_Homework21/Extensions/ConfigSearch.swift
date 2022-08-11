//
//  ConfigSearch.swift
//  GiorgiPilishvili_Homework21
//
//  Created by GIORGI PILISSHVILI on 11.08.22.
//

import Foundation
import UIKit

extension ViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    
    func updateSearchResults(for seaarchController: UISearchController) {
        
        let searchText = (searchController.searchBar.text ?? "")
            .lowercased()
            .trimmingCharacters(in: .whitespaces)
        
        filteredCountries = []
        
        if searchText.isEmpty {
            filteredCountries = arrayOfCountries
        }
        
        for country in arrayOfCountries {
            if country.name.lowercased().contains(searchText) {
                filteredCountries.append(country)
            }
        }
        
        self.tableViewCountries.reloadData()
        
    }
        
}
