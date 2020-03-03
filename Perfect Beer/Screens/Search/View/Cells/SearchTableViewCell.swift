//
//  SearchTableViewCell.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 03/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import UIKit
import SDWebImage

class SearchTableViewCell: UITableViewCell {
    
    static let nibName: String = String(describing: SearchTableViewCell.self)
    static let defaultReusableId: String = String(describing: SearchTableViewCell.self)
    
    // MARK: Outlets
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var firstBrewedLabel: UILabel!
    
    
    // MARK: Properties
    var model: Beer! {
        didSet {
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
            
        }
    }

    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        beerImage.sd_cancelCurrentImageLoad()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
