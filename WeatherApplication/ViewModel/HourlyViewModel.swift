//
//  HourlyViewModel.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import Foundation

class HourlyViewModel {
    var model: [HourlyModel]
    
    init(model: [HourlyModel]) {
        self.model = model
    }
    
    var numberOfRows: Int {
        model.count
    }
    
    func temperature(at hour: Int) -> String {
        let temperature = "\(model[hour].temp.inCelcius)°"
        return String(temperature)
    }
    
    func humidity(at hour: Int) -> String {
        let humidity = "\(model[hour].humidity)%"
        return String(humidity)
    }
    
    func weatherIcon(for hour: Int) -> String {
        guard let icon = model[hour].weather.first?.icon else { return "" }
        return icon
    }
    
    func time(of hour: Int) -> String {
        model[hour].dt.time
    }
}
