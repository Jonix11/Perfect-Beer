//
//  SearchPresenter.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import Foundation

final class SearchPresenter {
    
    public private(set) var searchService: RepositoryProtocol
    public private(set) weak var ui: SearchViewProtocol?
    
    init(with ui: SearchViewProtocol, searchService: RepositoryProtocol) {
        self.ui = ui
        self.searchService = searchService
    }
}

extension SearchPresenter: SearchPresenterProtocol {
    func getSearchedBeerList(by food: String) {
        searchService.getBeersWithPairing(food: food, success: { [weak self] (beerList) in
            // TODO: Controlar si la lista se devuelve vacía
            self?.ui?.setBeerList(with: beerList)
        }, failure: { [weak self] (error) in
            // TODO: Mostrar error
        })
    }
    
}
