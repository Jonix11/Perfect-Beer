//
//  NetworkingConstants.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import Foundation

struct PunkAPIConstant {
    static func getBeersURL(by food: String) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.punkapi.com"
        components.path = "/v2/beers"
        components.queryItems = [URLQueryItem(name: "food", value: food)]
        
        return components.url!
    }
}
