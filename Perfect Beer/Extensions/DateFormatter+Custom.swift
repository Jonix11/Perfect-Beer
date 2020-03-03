//
//  DateFormatter+Custom.swift
//  Perfect Beer
//
//  Created by Jon Gonzalez on 02/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let punkAPIDateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/yyyy"
        return formatter
    }()
}
