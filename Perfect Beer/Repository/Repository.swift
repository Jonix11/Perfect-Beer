//
//  Repository.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import Foundation

final class Repository {
    static let remote: RepositoryProtocol = RemoteRepository()
}

protocol RepositoryProtocol: AnyObject {
    var apiConsumer: PunkAPIConsumable { get }
    func getBeersWithPairing(food: String, success: @escaping ([Beer]) -> Void, failure: @escaping (Error?) -> Void)
}

final class RemoteRepository: RepositoryProtocol {
    var apiConsumer: PunkAPIConsumable = PunkAPIConsumerAlamofire()
    
    func getBeersWithPairing(food: String, success: @escaping ([Beer]) -> Void, failure: @escaping (Error?) -> Void) {
        apiConsumer.getSearchedBeers(by: food, success: { (beers) in
            assert(Thread.current == Thread.main)
            success(beers)
        }, failure: { (error) in
            assert(Thread.current == Thread.main)
            failure(error)
        })
    }
    
    
}
