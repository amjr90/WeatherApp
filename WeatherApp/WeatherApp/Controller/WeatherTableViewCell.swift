//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by andres jaramillo on 13/07/21.
//

import UIKit
import Kingfisher

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    func configure(consolidatedWeather: ConsolidatedWeather){
        dateLabel.text = consolidatedWeather.applicableDate ?? ""
        tempLabel.text = "\((Int)(consolidatedWeather.theTemp ?? 0))º"
        minTempLabel.text = "\((Int)(consolidatedWeather.minTemp ?? 0))º"
        maxTempLabel.text = "\((Int)(consolidatedWeather.maxTemp ?? 0))º"
        downloadImage(consolidatedWeather: consolidatedWeather)
    }
    
    func downloadImage(consolidatedWeather: ConsolidatedWeather){
        let url = URL(string: "\(Apis.baseUrl)\(Apis.image)\(consolidatedWeather.weatherStateAbbr ?? "").png")
        
        imageView?.image = nil
        imageview.kf.indicatorType = .activity
        imageview.kf.setImage(with: url)
    }
}
