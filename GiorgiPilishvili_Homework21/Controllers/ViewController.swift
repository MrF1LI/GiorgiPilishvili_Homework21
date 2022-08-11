//
//  ViewController.swift
//  GiorgiPilishvili_Homework21
//
//  Created by GIORGI PILISSHVILI on 10.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Variables
    
    @IBOutlet weak var tableViewCountries: UITableView!
    
    let searchController = UISearchController()
    var arrayOfCountries = [Country]()
    var filteredCountries = [Country]()
    
    // MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureNavigationItem()
        configureTableView()
        getCountriesData()
    }
    
    // MARK: Functions
    
    func configureNavigationItem() {
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        navigationItem.searchController = searchController
    }
    
    func configureTableView() {
        tableViewCountries.delegate = self
        tableViewCountries.dataSource = self
        tableViewCountries.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
    }
    
    func getCountriesData() {
        
        let urlString = "https://restcountries.com/v2/all"
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard error == nil else { return }
                
                if let data = data {
                    self.loadCountries(with: data)
                }
                
            }.resume()
            
        }
        
    }
    
    func loadCountries(with data: Data) {
        let object = try? JSONDecoder().decode([Country].self, from: data)
        self.arrayOfCountries = object ?? []
        
        DispatchQueue.main.async {
            self.filteredCountries = self.arrayOfCountries
            self.tableViewCountries.reloadData()
        }
    }
    
}
