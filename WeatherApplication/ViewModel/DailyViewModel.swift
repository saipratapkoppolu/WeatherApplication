//
//  DailyViewModel.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import Foundation

class DailyViewModel {
    var model: [DailyModel]
    
    init(model: [DailyModel]) {
        self.model = model
    }
    
    func weatherIcon(for day: Int) -> String {
        guard let icon = model[day].weather.first?.icon else { return "" }
        return icon
    }
    
    func date(for day: Int) -> String {
        model[day].dt.day
    }
    
    func getWeatherDescription(for day: Int) -> String? {
        guard let description = model[day].weather.first?.description else { return "" }
        return description
    }
    
    func temperature(on day: Int) -> String {
        "\(model[day].temp.min.inCelcius)° \(model[day].temp.max.inCelcius)°"
    }
}
