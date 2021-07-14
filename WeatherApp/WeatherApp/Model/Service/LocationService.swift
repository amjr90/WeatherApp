//
//  LocationService.swift
//  WeatherApp
//
//  Created by andres jaramillo on 14/07/21.
//

import Foundation

protocol LocationServiceProtocol {
    func searchLocation(query: String, completion: @escaping([Location])->Void)
    func locationWeather(location: Location, completion: @escaping(LocationWeather)->Void)
}

class LocationService: LocationServiceProtocol {
    
    let networkManager = NetworkManager()
    
    func searchLocation(query: String, completion: @escaping ([Location]) -> Void) {
        let url = Util.codificarUrl(url: "\(Apis.baseUrl)\(Apis.locationSearch)\(query)")
        var locations = [Location]()
        
        networkManager.get(url: url) { response in
            if response.error != nil{
                return
            }
            
            locations = try! JSONDecoder().decode([Location].self, from: response.data!)
            completion(locations)
        }
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
