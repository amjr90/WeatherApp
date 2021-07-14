//
//  LocationViewController.swift
//  WeatherApp
//
//  Created by andres jaramillo on 13/07/21.
//

import UIKit
import Kingfisher

class LocationViewController: UIViewController {

    @IBOutlet weak var weatherInfoLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tempInfoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    
    var locationViewModel: LocationViewModel?
    
    func configure(locationViewModel: LocationViewModel){
        self.locationViewModel = locationViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI(){
        self.title = locationViewModel!.location.title
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        
        locationViewModel?.fetchLocationData {
            self.configureCurrentTemp()
            self.tableview.reloadData()
        }
    }
    
    func configureCurrentTemp(){
        let currentWeather = locationViewModel!.consolidationWeather[0]
        self.weatherInfoLabel.text = currentWeather.weatherStateName ?? ""
        self.currentWeatherLabel.text = "\((Int)(currentWeather.theTemp ?? 0))º"
        self.downloadImage(image: currentWeather.weatherStateAbbr ?? "")
        self.tempInfoLabel.text = "min: \((Int)(currentWeather.minTemp ?? 0))º     max: \((Int)(currentWeather.maxTemp ?? 0))º"
    }
    
    func downloadImage(image: String)
    {
        let url = URL(string: "\(Apis.baseUrl)\(Apis.image)\(image).png")
        
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }
}

extension LocationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationViewModel!.consolidationWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        cell.configure(consolidatedWeather: locationViewModel!.consolidationWeather[indexPath.row])
        return cell
    }
}
