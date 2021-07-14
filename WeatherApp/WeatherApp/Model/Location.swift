//
//  Location.swift
//  WeatherApp
//
//  Created by andres jaramillo on 13/07/21.
//

import Foundation

struct Location: Codable {
    let title, locationType: String?
    let woeid: Int?
    let lattLong: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
        case lattLong = "latt_long"
    }
    
    static func mockLocation()->Location{
        return Location(title: "Bogotá", locationType: "City", woeid: 368148, lattLong: "4.656370,-74.117790")
    }
}
