//
//  NetworkingConstants.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import Foundation

struct PunkAPIConstant {
    
    private static func baseURL() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.punkapi.com"
        components.path = "/v2"
        
        return components.url!
    }
    
    private static func beersEndpoint() -> URL {
        var components = URLComponents()
        components.scheme = baseURL().scheme
        components.host = baseURL().host
        components.path = baseURL().path + "/beers"
        
        return components.url!
    }
    
    static func getBeersURL() -> URL {
        var components = URLComponents()
        components.scheme = beersEndpoint().scheme
        components.host = beersEndpoint().host
        components.path = beersEndpoint().path
        
        return components.url!
    }
    
    static func getBeersURL(by food: String) -> URL {
        var components = URLComponents()
        components.scheme = beersEndpoint().scheme
        components.host = beersEndpoint().host
        components.path = beersEndpoint().path
        components.queryItems = [URLQueryItem(name: "food", value: food)]
        
        return components.url!
    }
}
