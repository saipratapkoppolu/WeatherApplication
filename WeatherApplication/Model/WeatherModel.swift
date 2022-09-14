//
//  WeatherModel.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import Foundation

struct WeatherModel: Decodable {
    let hourly: [HourlyModel]
    let daily: [DailyModel]
}

struct HourlyModel: Decodable {
    let dt: Date
    let temp: Double
    let humidity: Int
    let weather: [Weather]
}

struct DailyModel: Decodable {
    let dt: Date
    let temp: Temperature
    let weather: [Weather]
}

struct Temperature: Decodable {
    let min: Double
    let max: Double
}

struct Weather: Decodable {
    let id: Int
    let icon: String
    let description: String
}
