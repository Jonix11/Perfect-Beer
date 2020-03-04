//
//  SearchViewController.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import UIKit

enum SearchViewState {
    case loading
    case error
    case success
    case empty
}

class SearchViewController: UIViewController {
    
    // MARK: Properties
    var model: [Beer] = []
    
    var state: SearchViewState! {
        didSet {
            switch state {
            case .empty:
                stateView.isHidden = false
                infoView.isHidden = false
                infoImage.image = UIImage(systemName: "info.circle.fill")
                infoImage.tintColor = UIColor.systemBlue
                infoLabel.text = "There aren't beers that fit the search"
            case .error:
                stateView.isHidden = false
                infoView.isHidden = false
                infoImage.image = UIImage(systemName: "xmark.circle.fill")
                infoImage.tintColor = UIColor.systemRed
                infoLabel.text = "There was a problem loading beers list"
            case .success:
                stateView.isHidden = true
            case .loading:
                stateView.isHidden = false
                infoView.isHidden = true
            case .none:
                stateView.isHidden = true
            }
        }
    }
    
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
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        state = .loading
        beerTableView.dataSource = self
        beerTableView.delegate = self
        beerSearchBar.delegate = self
        
        presenter.getFirstBeersList()
    }

}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = model[indexPath.row]
        
        let detailViewController = DetailViewController(model: beer)
        self.present(detailViewController, animated: true)
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
        cell.selectionStyle = .none
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        state = .loading
        if searchText.count == 0 {
            presenter.getFirstBeersList()
        } else {
            presenter.getSearchedBeerList(by: searchText)
        }
    }
}

extension SearchViewController: SearchViewProtocol {
    func setErrorView() {
        state = .error
    }
    
    func setEmptyView() {
        state = .empty
    }
    
    func setBeerList(with beers: [Beer]) {
        model = beers
        beerTableView.reloadData()
        state = .success
    }
}


