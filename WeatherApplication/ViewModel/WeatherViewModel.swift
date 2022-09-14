//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import Foundation
import CoreLocation
import UIKit

enum CurrentLocation: Int {
    case rioDeJaneiro = 0
    case beijing
    case losAngeles
    
    var latitude: Double {
        switch self {
        case .rioDeJaneiro:
            return -22.90278
        case .beijing:
            return 39.9075
        case .losAngeles:
            return 34.0239
        }
    }
    
    var longitude: Double {
        switch self {
        case .rioDeJaneiro:
            return -43.2075
        case .beijing:
            return 116.39723
        case .losAngeles:
            return -118.17202
        }
    }
}

class WeatherViewModel {
    
    private var weather: WeatherModel = WeatherModel(hourly: [], daily: [])
    
    var currentLocation: CurrentLocation = .rioDeJaneiro
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: currentLocation.latitude,
            longitude: currentLocation.longitude
        )
    }
    
    var hourlyViewModel: HourlyViewModel {
        HourlyViewModel(model: weather.hourly)
    }
    
    var dailyViewModel: DailyViewModel {
        DailyViewModel(model: weather.daily)
    }
    
    var lastUpdated: String {
        "Last updated on \(Date().day) \(Date().time)"
    }
    
    func numberOfRows(in section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 5
    }
    
    func getSectionTitle(for section: Int) -> String {
        section == 0 ? Constants.hoursSectionTitle : Constants.daysSectionTitle
    }
}
