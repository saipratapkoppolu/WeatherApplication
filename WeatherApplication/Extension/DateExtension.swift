//
//  DateExtension.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import Foundation

extension Date {
    var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: self)
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d"
        return dateFormatter.string(from: self)
    }
}
