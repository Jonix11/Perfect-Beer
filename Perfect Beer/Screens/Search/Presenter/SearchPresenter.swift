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
        searchService.getBeersWithPairing(food: food, success: <#T##([Beer]) -> Void#>, failure: <#T##(Error?) -> Void#>)
    }
    
}
