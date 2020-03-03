//
//  Assembly.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import UIKit

final class Assembler {
    static func provideSearchView() -> UIViewController {
        let searchView = SearchViewController()
        let presenter = SearchPresenter(with: searchView, searchService: Repository.remote)
        searchView.configure(with: presenter)
        return searchView
    }
}
