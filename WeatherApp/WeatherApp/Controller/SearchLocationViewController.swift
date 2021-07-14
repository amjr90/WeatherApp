//
//  ViewController.swift
//  WeatherApp
//
//  Created by andres jaramillo on 10/07/21.
//

import UIKit

class SearchLocationViewController: UIViewController {
    
    @IBOutlet weak var searchbar: UISearchBar?
    @IBOutlet weak var tableview: UITableView?
    
    var searchLocationViewModel = SearchLocationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI(){
        searchbar?.delegate = self
        tableview?.delegate = self
        tableview?.dataSource = self
        tableview?.tableFooterView = UIView()
    }
    
    private func goToLocation(){
        performSegue(withIdentifier: "goToLocation", sender: self)
    }
}

extension SearchLocationViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            searchLocationViewModel.searchLocation(query: searchText) {
                self.tableview?.reloadData()
            }
        }
        else{
            searchLocationViewModel.locations = [Location]()
            self.tableview?.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchLocationViewModel.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview?.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell?.textLabel?.text = searchLocationViewModel.locations[indexPath.row].title
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview?.deselectRow(at: indexPath, animated: true)
        searchLocationViewModel.selectedLocation = searchLocationViewModel.locations[indexPath.row]
        goToLocation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? LocationViewController
        vc?.configure(locationViewModel: LocationViewModel(location: searchLocationViewModel.selectedLocation!))
    }
    
}
