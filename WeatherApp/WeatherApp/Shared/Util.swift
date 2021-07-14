//
//  Util.swift
//  WeatherApp
//
//  Created by andres jaramillo on 13/07/21.
//

import Foundation

struct Util {
    public static func codificarUrl(url:String) -> String {
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        return safeURL
    }
}
