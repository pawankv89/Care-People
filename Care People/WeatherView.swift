//
//  WeatherView.swift
//  Care People
//
//  Created by Pawan kumar on 15/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    @IBOutlet weak var currentIcon: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var currentTemperature: UILabel!
    @IBOutlet weak var bluntPhrase: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var today: UILabel!
    @IBOutlet weak var narrative: UILabel!

    @IBOutlet weak var dayOne: UILabel!
    @IBOutlet weak var dayTwo: UILabel!
    @IBOutlet weak var dayThree: UILabel!
    @IBOutlet weak var iconOne: UIImageView!
    @IBOutlet weak var iconTwo: UIImageView!
    @IBOutlet weak var iconThree: UIImageView!
    @IBOutlet weak var tempOne: UILabel!
    @IBOutlet weak var tempTwo: UILabel!
    @IBOutlet weak var tempThree: UILabel!

    func setup(user: UserModel, weather: CurrentModel, forecasts: [ForecastsModel]) {
        // Setup the layer
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        
        // Set the image
        currentIcon.image = UIImage(named: "\(weather.iconCode)")
        
        if user.location.street.count > 20 {
            location.font.withSize(12.0)
        }
        location.text = user.location.street
        
        currentTemperature.text = "\(weather.temperature)\u{00B0}"
        bluntPhrase.text = weather.wxPhraseMedium
        bluntPhrase.lineBreakMode = .byWordWrapping
        bluntPhrase.numberOfLines = 0
        feelsLike.text = "\(weather.temperatureFeelsLike)\u{00B0}"
        humidity.text = "\(weather.relativeHumidity)%"
        wind.text = "\(weather.windSpeed)mph \(weather.windDirectionCardinal)"

        let daily: DailyModel = forecasts[0].day ?? forecasts[0].night
        
        //today
        today.text = daily.daypart_name
        narrative.text = daily.narrative
        narrative.lineBreakMode = .byWordWrapping
        narrative.numberOfLines = 0
        
        //dayOne
        dayOne.text = forecasts[1].dow
        //dayTwo
        dayTwo.text = forecasts[2].dow
        //dayThree
        dayThree.text = forecasts[3].dow
        
        iconOne.image = UIImage(named: "\(forecasts[1].day.icon_code)")
        iconTwo.image = UIImage(named: "\(forecasts[2].day.icon_code)")
        iconThree.image = UIImage(named: "\(forecasts[3].day.icon_code)")
        
        tempOne.text = "\(forecasts[1].max_temp)\u{00B0} | \(forecasts[1].min_temp)\u{00B0}"
        tempTwo.text = "\(forecasts[2].max_temp)\u{00B0} | \(forecasts[2].min_temp)\u{00B0}"
        tempThree.text = "\(forecasts[3].max_temp)\u{00B0} | \(forecasts[3].min_temp)\u{00B0}"
    }
}
