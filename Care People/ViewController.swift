//
//  ViewController.swift
//  Care People
//
//  Created by Pawan kumar on 10/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import NMAKit

class ViewController: UIViewController
{
    @IBOutlet weak var mapView: NMAMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make sure copyright logo is visible according to your App's UI design
        mapView.copyrightLogoPosition = NMALayoutPosition.bottomLeft
        // Show current position indicator
        mapView.positionIndicator.isVisible = true
        mapView.positionIndicator.isAccuracyIndicatorVisible = true
    }

    @IBAction func trackingButtonChanged(_ button: UIButton) {
        if (NMANavigationManager.sharedInstance().navigationState == .idle) {
            NMANavigationManager.sharedInstance().map = self.mapView;
            let error = NMANavigationManager.sharedInstance().startTracking(.car)
            if (error == nil) {
                button.setTitle("Stop Tracking", for:[])
            }
        } else {
            NMANavigationManager.sharedInstance().stop()
            self.mapView.tilt = 0
            button.setTitle("Track Current Location", for:[])
        }
    }
}
