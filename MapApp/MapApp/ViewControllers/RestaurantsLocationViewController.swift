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
    
    var restaurants: [Restaurant] = []
    
    let locationManager = CLLocationManager()
    private let kNextSegue = "NextSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        checkLocationAuthorizationStatus { (pGranted) in
            if pGranted {
                self.mapView.showsUserLocation = true
            } else {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
        fetchRestuarants()
    }
    
    //MARK:- Fetch data from API
    
    func fetchRestuarants() {
        APIService.fetchRestaurantData { (pRestaurants, pError) in
            if pError == nil {
                if let theRestaurants = pRestaurants {
                    self.restaurants = theRestaurants
                    self.createAnnotations()
                }
            }
        }
    }
    
    //MARK:- Annotations
    
    func createAnnotations() {
        restaurants.forEach { (pRestaurant) in
            let annotations = MKPointAnnotation()
            annotations.title = pRestaurant.name
            annotations.coordinate = CLLocationCoordinate2D(latitude: pRestaurant.latitude.ma_toDouble, longitude: pRestaurant.longitude.ma_toDouble)
            mapView.addAnnotation(annotations)
        }
    }
    
    //MARK:- Location Permissions
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


//MARK:- MapView Delegate

extension RestaurantsLocationViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation Pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)))
            button.ma_addCornerRadius(8)
            button.backgroundColor = .ma_goldColor
            button.addTarget(self, action: #selector(goToDetailScreen(sender:)), for: .touchUpInside)
            annotationView?.rightCalloutAccessoryView = button
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
    
    @objc func goToDetailScreen(sender pSender: UIButton) {
        performSegue(withIdentifier: kNextSegue, sender: self)
    }
}
