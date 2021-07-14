//
//  SearchLocationViewModel.swift
//  WeatherApp
//
//  Created by andres jaramillo on 14/07/21.
//

import Foundation

class SearchLocationViewModel {
    var locations = [Location]()
    var selectedLocation: Location?
    let repository: LocationRepositoryProtocol
    
    init(repository: LocationRepositoryProtocol = LocationRepository()) {
        self.repository = repository
    }
    
    func searchLocation(query: String, completion: @escaping ()->()){
        if query.count > 0{
            repository.searchLocation(query: query) { locations in
                DispatchQueue.main.async {
                    self.locations = locations
                    completion()
                }
            }
        }
        else{
            self.locations = [Location]()
        }
    }
}
