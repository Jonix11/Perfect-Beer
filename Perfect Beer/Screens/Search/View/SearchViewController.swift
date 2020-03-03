//
//  SearchViewController.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: Properties
    var model: [Beer] = []
    
    // MARK: Presenter elements
    public private(set) var presenter: SearchPresenterProtocol!
    
    func configure(with presenter: SearchPresenterProtocol) {
        self.presenter = presenter
    }

    // MARK: Outlets
    @IBOutlet weak var beerSearchBar: UISearchBar!
    @IBOutlet weak var beerTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: SearchTableViewCell.nibName, bundle: nil)
            beerTableView.register(nib, forCellReuseIdentifier: SearchTableViewCell.defaultReusableId)
        }
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        beerTableView.dataSource = self
        beerTableView.delegate = self
        beerSearchBar.delegate = self
    }

}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = beerTableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.defaultReusableId, for: indexPath) as? SearchTableViewCell else {
            fatalError()
        }
        let beer = model[indexPath.item]
        cell.model = beer
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        presenter.getSearchedBeerList(by: searchText)
        
//        let alert = UIAlertController(title: searchText, message: "", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Accept", style: .default, handler: nil))
//        self.present(alert, animated: true)
    }
}

extension SearchViewController: SearchViewProtocol {
    func setBeerList(with beers: [Beer]) {
        model = beers
        beerTableView.reloadData()
    }
}


