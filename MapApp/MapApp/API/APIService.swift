//
//  APIService.swift
//  MapApp
//
//  Created by Bashir Sentongo on 28/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class APIService {
    
    class func fetchRestaurantData(completion pCompletion: @escaping ([Restaurant]?, Error?) -> Void) {
        guard let url = URL(string: "https://www.frankieandbennys.com/trg_restaurant_feed/JSON") else { return }        
        URLSession.shared.dataTask(with: url) { (pData, _, pError) in
            guard let data = pData else { return }
            do {
                let results = try JSONDecoder().decode([Restaurant].self, from: data)
                pCompletion(results, nil)
            } catch let decodeError {
                pCompletion(nil, decodeError)
            }
        } .resume()
    }
}
