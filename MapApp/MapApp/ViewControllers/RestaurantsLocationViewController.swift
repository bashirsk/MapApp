//
//  RestaurantsLocationViewController.swift
//  MapApp
//
//  Created by Bashir Sentongo on 28/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit
import MapKit

class RestaurantsLocationViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
        
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        checkLocationAuthorizationStatus { (pGranted) in
            if pGranted {
                self.mapView.showsUserLocation = true
            } else {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
    }
    
    func checkLocationAuthorizationStatus(completion pCompletion: @escaping (Bool) -> Void) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            pCompletion(true)
            break
        default:
            pCompletion(false)
        }
    }
}

extension RestaurantsLocationViewController: CLLocationManagerDelegate {}
