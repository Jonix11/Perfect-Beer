//
//  PunkAPIConsumable.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import Foundation

protocol PunkAPIConsumable {
    func getSearchedBeers(by food: String, success: @escaping ([Beer]) -> Void, failure: @escaping (Error?) -> Void)
}
