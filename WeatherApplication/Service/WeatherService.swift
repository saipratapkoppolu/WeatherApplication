//
//  WeatherService.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import Foundation
import Combine
import CoreLocation

enum CustomError: Error {
    case invalidData
    case parsingError
}

class WeatherService {
    private let apiKey = "482944e26d320a80bd5e4f23b3de7d1f"
    
    func fetchWeather(for location: CLLocationCoordinate2D, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/onecall")
        
        let latitude = URLQueryItem(name: "lat", value: String(location.latitude))
        let longitude = URLQueryItem(name: "lon", value: String(location.longitude))
        let apiKey = URLQueryItem(name: "appID", value: apiKey)
        let excluding = URLQueryItem(name: "exclude", value: "current,minutely")
        
        components?.queryItems = [latitude, longitude, excluding, apiKey]

        guard let url = components?.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(CustomError.invalidData))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .secondsSince1970
                let json = try jsonDecoder.decode(WeatherModel.self, from: data)
                completion(.success(json))
            } catch {
                completion(.failure(CustomError.parsingError))
            }
        }.resume()
    }
}
