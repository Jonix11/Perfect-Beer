//
//  SearchProtocols.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import Foundation

protocol SearchViewProtocol: AnyObject {
    func setBeerList(with beers: [Beer])
    func setEmptyView()
    func setErrorView()
}

protocol SearchPresenterProtocol: AnyObject {
    func getSearchedBeerList(by food: String)
    func getFirstBeersList()
}
