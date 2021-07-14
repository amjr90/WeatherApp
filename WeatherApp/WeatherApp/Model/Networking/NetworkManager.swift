//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by andres jaramillo on 13/07/21.
//

import Foundation
import Alamofire

class NetworkManager {
    
    let queue = DispatchQueue(label: "com.amjr.weatherapp", qos: .background)
    
    func get(url: String, completion: @escaping(AFDataResponse<Any>)->Void){
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")

        AF.request(request).responseJSON(queue: queue) { (response) in
            completion(response)
        }
    }
}
