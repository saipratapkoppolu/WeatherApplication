//
//  DoubleExtension.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import Foundation

extension Double {
    var inCelcius: Int {
        return Int(self - 273.15)
    }
}
