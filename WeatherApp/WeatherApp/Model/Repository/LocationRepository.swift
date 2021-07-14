//
//  LocationRepository.swift
//  WeatherApp
//
//  Created by andres jaramillo on 14/07/21.
//

import Foundation


protocol LocationRepositoryProtocol {
    func searchLocation(query: String, completion: @escaping([Location])->Void)
    func locationWeather(location: Location, completion: @escaping(LocationWeather)->Void)
}

class LocationRepository: LocationRepositoryProtocol{
    
    let locationService: LocationServiceProtocol
    
    init(locationService: LocationServiceProtocol = LocationService()) {
        self.locationService = locationService
    }
    
    func searchLocation(query: String, completion: @escaping ([Location]) -> Void) {
        locationService.searchLocation(query: query) { locations in
            completion(locations)
        }
    }
    
    func locationWeather(location: Location, completion: @escaping (LocationWeather) -> Void) {
        locationService.locationWeather(location: location) { locationWeather in
            completion(locationWeather)
        }
    }
}
