//
//  SearchViewController.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: Presenter elements
    public private(set) var presenter: SearchPresenterProtocol!
    
    func configure(with presenter: SearchPresenterProtocol) {
        self.presenter = presenter
    }

    // MARK: Outlets
    @IBOutlet weak var beerSearchBar: UISearchBar!
    @IBOutlet weak var beerTableView: UITableView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        beerTableView.dataSource = self
        beerTableView.delegate = self
    }

}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //TODO
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell() //TODO
    }
}

extension SearchViewController: SearchViewProtocol {
    func setBeerList(with beers: [Beer]) {
        <#code#>
    }
}
