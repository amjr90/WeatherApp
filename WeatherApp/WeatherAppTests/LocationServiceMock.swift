//
//  LocationServiceMock.swift
//  WeatherAppTests
//
//  Created by andres jaramillo on 14/07/21.
//

import Foundation
@testable import WeatherApp

class LocationServiceMock: LocationServiceProtocol {
    
    let networkManager = NetworkManager()
    
    func searchLocation(query: String, completion: @escaping ([Location]) -> Void) {
        var locations = [Location]()
        locations.append(Location.mockLocation())
        completion(locations)
    }
    
    func locationWeather(location: Location, completion: @escaping (LocationWeather) -> Void) {
        let url = "\(Apis.baseUrl)\(Apis.location)\(location.woeid ?? 0)"
        networkManager.get(url: url) { response in
            if response.error != nil{
                return
            }
            
            let locationWeather = try! JSONDecoder().decode(LocationWeather.self, from: response.data!)
            
            completion(locationWeather)
        }
    }
}
