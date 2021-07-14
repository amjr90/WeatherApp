//
//  LocationViewModel.swift
//  WeatherApp
//
//  Created by andres jaramillo on 14/07/21.
//

import Foundation

class LocationViewModel {
    
    var location: Location
    var consolidationWeather = [ConsolidatedWeather]()
    
    let repository: LocationRepositoryProtocol
    
    init(location: Location, repository: LocationRepositoryProtocol = LocationRepository()) {
        self.location = location
        self.repository = repository
    }
    
    func fetchLocationData(completion: @escaping ()->()){
        repository.locationWeather(location: location) { locationWeather in
            DispatchQueue.main.async {
                var consolidationWeather = locationWeather.consolidatedWeather!
                consolidationWeather.removeFirst()
                self.consolidationWeather = consolidationWeather
                completion()
            }
        }
    }
}
