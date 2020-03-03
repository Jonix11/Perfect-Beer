//
//  Beer.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 02/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import Foundation

struct Beer {
    let beerId: Int
    let name: String?
    let tagline: String?
    let firstBrewed: Date?
    let description: String?
    let image: String?
    let abv: Double?
    let foodPairing: [String]?
    
    init (beerId: Int, name: String? = nil, tagline: String? = nil, firstBrewed: Date? = nil, description: String? = nil, image: String? = nil, abv: Double? = nil, foodPairing: [String]? = nil) {
        self.beerId = beerId
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.description = description
        self.image = image
        self.abv = abv
        self.foodPairing = foodPairing
    }
}

extension Beer: Codable {
    
    enum CodingKeys: String, CodingKey {
        case beerId = "id"
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case image = "image_url"
        case abv
        case foodPairing = "food_pairing"
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        beerId = try container.decode(Int.self, forKey: .beerId)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
        if let firstBrewedString = try container.decodeIfPresent(String.self, forKey: .firstBrewed) {
            firstBrewed = DateFormatter.punkAPIDateFormatter.date(from: firstBrewedString)
        } else {
            firstBrewed = nil
        }
        description = try container.decodeIfPresent(String.self, forKey: .description)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        abv = try container.decodeIfPresent(Double.self, forKey: .abv)
        foodPairing = try container.decodeIfPresent([String].self, forKey: .foodPairing)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(beerId, forKey: .beerId)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(tagline, forKey: .tagline)
        if let date = firstBrewed {
            try container.encode(DateFormatter.punkAPIDateFormatter.string(from: date), forKey: .firstBrewed)
        }
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(abv, forKey: .abv)
        try container.encodeIfPresent(foodPairing, forKey: .foodPairing)
    }
}
