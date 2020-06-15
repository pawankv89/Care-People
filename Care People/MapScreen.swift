//
//  MapScreen.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation
import NMAKit

class MapScreen: UIViewController, NMAMapViewDelegate
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var mapView: NMAMapView!
    
    var calloutView: UIView!

    var user: UserModel!
    
    let marker: NMAMapMarker
    
    var current: CurrentModel!
    
    var forecasts = [ForecastsModel]()
    
    //"35.843686"
    //"-78.78548"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.nameLabel.text = user.firstname + " " + user.lastname
        self.addressLabel.text = user.location.address
        
        // Make sure copyright logo is visible according to your App's UI design
        mapView.copyrightLogoPosition = NMALayoutPosition.bottomLeft
        // Show current position indicator
        mapView.positionIndicator.isVisible = true
        mapView.positionIndicator.isAccuracyIndicatorVisible = true
        
        // Map Marker Delegate
        mapView.delegate = self
        
        // Add Marker
        let latitude = user.location.coordinates.latitude.doubleValue
        let longitude = user.location.coordinates.longitude.doubleValue
        let coordiate = NMAGeoCoordinates.init(latitude: latitude, longitude: longitude)
        addMarker(coordinates: coordiate)
        
        self.sendRequestObservationsCurrentApi()
        self.sendRequestDailyForecast3DayApi()
         
    }
    
    //I will Go Back
    @IBAction func backButton(_ button: UIButton) {
       self.navigationController?.popViewController(animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        marker = NMAMapMarker()
        marker.icon = NMAImage(uiImage: #imageLiteral(resourceName: "marker"))
        super.init(coder: aDecoder)
    }
    
    func addMarker(coordinates coord: NMAGeoCoordinates) {
        mapView.remove(mapObject: marker)
        marker.coordinates = coord
        mapView.add(mapObject: marker)
        mapView.set(geoCenter: coord, animation: NMAMapAnimation.none)
    }
    
    func mapView(_ mapView: NMAMapView, didSelect objects: [NMAViewObject]) {
      for object in objects {
         // Search for NMAMapMarkers only
         if object is NMAMapMarker {
              // Get your map marker as follow
              let mapMarker = object as! NMAMapMarker
              // Check if you found your map marker by checking coordinates
              // Show desired information with your custom method
            
              print("didSelect NMAMapMarker ", mapMarker)
            
             self.displayCalloutView()
          }
        }
    }
    
    func sendRequestObservationsCurrentApi() -> () {
        
        let parameters = [
            "lat" : self.user.location.coordinates.latitude,
            "lng" : self.user.location.coordinates.longitude,
            "units" : "m",
            "language" : "en-US",
            "format" : "json",
            "apiKey" : "320c9252a6e642f38c9252a6e682f3c6",
            ]
        
        //API Called
        APIManager.shared.observationsCurrentApi(parameters: parameters, completionHandler: { (jsonResponse) -> Void in
        
            //Print
            DLogs.logs(printMessage: "completionHandler", printDetails:jsonResponse)
            
            if let currentObj = jsonResponse as? [String: Any]
            {
                self.current = CurrentModel(json: currentObj)
            }
        
            // Update here
            
        })
    }
    
    func sendRequestDailyForecast3DayApi() -> () {
        
        let parameters = [
            "lat" : self.user.location.coordinates.latitude,
            "lng" : self.user.location.coordinates.longitude,
            "units" : "m",
            "language" : "en-US",
            "apiKey" : "320c9252a6e642f38c9252a6e682f3c6",
            ]
        
        //Clear Old Data
        self.forecasts.removeAll()
        self.forecasts = []
        
        //API Called
        APIManager.shared.dailyForecast3DayApi(parameters: parameters, completionHandler: { (jsonResponse) -> Void in
        
            //Print
            DLogs.logs(printMessage: "completionHandler", printDetails:jsonResponse)
            
            if (jsonResponse["forecasts"]) != nil
            {
                let forecastsList: Array<Any> = jsonResponse["forecasts"] as! Array<Any>
                for index in 0..<forecastsList.count {
                    if let forecastDict = forecastsList[index] as? [String: Any]
                    {
                        let forecast = ForecastsModel(json: forecastDict)
                        self.forecasts.append(forecast!)
                    }
                }
            }
            
            // Update here
            
        })
    }
    
    func displayCalloutView() -> () {
    
        calloutView = self.getWeatherView(user: user, weather: self.current, forecasts: self.forecasts)

        let calloutTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.calloutTapped(recognizer:)))
        calloutView.addGestureRecognizer(calloutTapRecognizer)

        self.mapView.addSubview(calloutView)
        //self.view.addSubview(calloutView)
        //calloutView.frame = CGRect.init(x: 0, y: view.bounds.size.width / 2, width: 320, height: 300)
        //calloutView.center = self.mapView.center
        calloutView.center = CGPoint(x: self.mapView.bounds.size.width / 2, y: self.mapView.bounds.size.height / 2 - 150)
    }
    
    // On callout tapped, show the 10 day forecast on the screen
       @objc func calloutTapped(recognizer: UITapGestureRecognizer?) {
           // Perform 10 day segue closure
        print("calloutTapped")
        calloutView.removeFromSuperview()
    }
    
    // Create the weather annotation view
    func getWeatherView(user: UserModel, weather: CurrentModel, forecasts: [ForecastsModel]) -> UIView {
        let views = Bundle.main.loadNibNamed("WeatherView", owner: nil, options: nil)

        // Ensure we are returned
        guard let calloutView = views?[0] as? WeatherView else {
            return UIView()
        }

        // Setup the view using our weather annotation data
        calloutView.setup(user: user, weather: weather, forecasts: forecasts)
        
        return calloutView
    }
}

