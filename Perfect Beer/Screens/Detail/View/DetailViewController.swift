//
//  DetailViewController.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 04/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    // MARK: Properties
    let model: Beer
    let foodCellHeight = 30
    
    // MARK: Initialization
    init(model: Beer) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Outlets
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var firstBrewedLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var foodTableView: UITableView!
    
    @IBOutlet weak var foodTableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodTableView.dataSource = self
        foodTableView.delegate = self
        
        syncModelWithView()
    }
    
    // MARK: Functions
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func syncModelWithView() {
        
        toolbar.barStyle = .default
        let cancelAction = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
        toolbar.items = [cancelAction]
        
        if let image = model.image {
            let url = URL(string: image)
            beerImage.sd_setImage(with: url, placeholderImage: UIImage(named: "BeerBottle"))
        } else {
            beerImage.image = UIImage(named: "BeerBottle")
        }
        
        if let name = model.name {
            nameLabel.text = name
        } else {
            nameLabel.text = "Beer without name"
        }
        
        if let tagline = model.tagline {
            taglineLabel.text = tagline
        } else {
            taglineLabel.text = "This beer doesn't have tagline"
        }
        
        if let firstBrewed = model.firstBrewed {
            firstBrewedLabel.text = DateFormatter.punkAPIDateFormatter.string(from: firstBrewed)
        } else {
            firstBrewedLabel.text = "n/a first brewed date"
        }
        
        if let abv = model.abv {
            abvLabel.text = String(abv) + "%"
        } else {
            abvLabel.text = "n/a"
        }
        
        if let description = model.description {
            descriptionTextView.text = description
        } else {
            descriptionTextView.text = "This beer doesn't have description."
        }
        
        foodTableViewHeight.constant = CGFloat((model.foodPairing?.count)! * foodCellHeight)
        
        foodTableView.reloadData()
        
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(foodCellHeight)
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = model.foodPairing?.count {
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = model.foodPairing![indexPath.row]
        
        let cellId = "foodCell"
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        cell.textLabel?.text = food
        cell.imageView?.image = UIImage(named: "food")
        cell.selectionStyle = .none
        
        return cell
    }
}
