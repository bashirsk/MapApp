//
//  Restaurant.swift
//  MapApp
//
//  Created by Bashir Sentongo on 28/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit
import MapKit
import Foundation

class Restaurant: NSObject, Decodable {
    
    let name: String
    let latitude: String
    let longitude: String
    let body: String
    let deliveryLink: String?
    
    init(name: String, latitude: String, longitude: String, body: String, deliveryLink: String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.body = body
        self.deliveryLink = deliveryLink
        super.init()
    }
        
    private enum CodingKeys: String, CodingKey {
        case deliveryLink = "delivery_link"
        case name
        case latitude
        case longitude
        case body
    }
}
