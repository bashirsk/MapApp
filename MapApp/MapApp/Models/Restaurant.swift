//
//  Restaurant.swift
//  MapApp
//
//  Created by Bashir Sentongo on 28/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit
import MapKit

class Restaurant: NSObject, MKAnnotation {
    
    let name: String
    let latitude: String
    let longitude: String
    let body: String
    let deliveryLink: String?
    var coordinate: CLLocationCoordinate2D
    
    init(name: String, latitude: String, longitude: String, body: String, deliveryLink: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.body = body
        self.deliveryLink = deliveryLink
        self.coordinate = coordinate
        super.init()
    }
    
    enum CodingKeys: String, CodingKey {
        case deliveryLink = "delivery_link"
    }
}
