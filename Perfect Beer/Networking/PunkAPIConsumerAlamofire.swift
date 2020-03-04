//
//  PunkAPIConsumerAlamofire.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import Foundation
import Alamofire

class PunkAPIConsumerAlamofire: PunkAPIConsumable {
    func getFirstBeers(onSuccess success: @escaping ([Beer]) -> Void, failure: @escaping (Error?) -> Void) {
        Alamofire.request(PunkAPIConstant.getBeersURL()).responseData { (response) in
            switch response.result {
            case .failure(let error):
                failure(error)
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let searchedBeers = try decoder.decode([Beer].self, from: data)
                    success(searchedBeers)
                } catch {
                    failure(error)
                }
            }
        }
    }
    
    func getSearchedBeers(by food: String, success: @escaping ([Beer]) -> Void, failure: @escaping (Error?) -> Void) {
        let foodUnderscored = food.replacingOccurrences(of: " ", with: "_")
        
        Alamofire.request(PunkAPIConstant.getBeersURL(by: foodUnderscored)).responseData { (response) in
            
            switch response.result {
            case .failure(let error):
                failure(error)
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let searchedBeers = try decoder.decode([Beer].self, from: data)
                    success(searchedBeers)
                } catch {
                    failure(error)
                }
            }
            
        }
    }
}
