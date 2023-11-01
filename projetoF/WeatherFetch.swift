//
//  APIfetch.swift
//  projetoF
//
//  Created by Pablo on 30/10/23.
//

import Foundation
import CoreLocation

class WeatherFetch: NSObject, ObservableObject {
    @Published var temperature: String = "Loading..."
    let locationManager = CLLocationManager()

    func fetchTemperature() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
}

extension WeatherFetch: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard locations.last != nil else { return }
        let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=ee81ed621bb540a1983190231233010&q=Mossoro&aqi=no")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            if let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data) {
                DispatchQueue.main.async {
                    self.temperature = "\(weatherData.current.temp_c)°C"
                }
            }
        }.resume()
    }
}

struct WeatherData: Codable {
    let current: Current
}

struct Current: Codable {
    let temp_c: Double
}
